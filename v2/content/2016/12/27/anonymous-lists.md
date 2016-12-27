<!-- title: Anonymous Mailing Lists with Mailman -->
<!-- categories: howto -->
<!-- tags: postfix,mailman,anonymous,email,dkim,spf -->
<!-- published: 2016-12-27T15:15:00-05:00 -->
<!-- updated: 2016-12-27T15:15:00-05:00 -->
<!-- summary: A quick guide to running anonymous mailing lists with Postfix, GNU Mailman, SPF, and DKIM. -->

# Anonymous Mailing Lists with Mailman

I run several anonymous mailing lists using [GNU Mailman](http://list.org/) and [Postfix](http://www.postfix.org/).

The first list started as part social and part technical experiment: a quasi-anonymous mailing list composed of "trusted" subscribers, in this case individuals with a shared employment history. The goal was to provide a venue to share previously-unspoken parting thoughts, industry rumors, and recollections.

Anonymity in email isn't simple, nor should it be depended upon for much more than amusement. Mailman has supported anonymous lists for years with minimal effort, but recent improvements to email security have made things a little more complicated. Over time and with a fair bit of trial and error, I've tuned my Mailman and Postfix configurations to reduce the leakage of subscriber identity. These days it's more common to see a subscriber include a personal email signature by mistake, outing themselves at the poster of a message.

There are social challenges too. When content isn't easily attributed to authors, some authors have a tendency to shit on others. Threads between a couple frustrated community members -- even those who know each other in real life -- can quickly devolve into a truly negative space that impacts participation from the whole. I plan to write more about these aspects in the future.

Anonymity in email isn't for everyone, but here's how to go about it. The following instructions assume you're already running Mailman 2.1.15+ and Postfix 2.10+. File paths assume a package-based distribution, such as CentOS 7.2. YMMV.

## Mailman list configuration

Navigate to the list’s administration page and make a few changes to general, privacy, and archival settings.

### General

    from_is_list: no
    anonymous_list: yes
    new_member_options: Conceal the member's address

Most of the magic happens when you enable `anonymous_list`; it hides the sender of a message, replacing it with the list address (removing From, Sender, and Reply-To fields).

### Privacy

    Subscription: subscribe_policy: confirm and approve

Approval is *highly recommended* if not mandatory. You really do *not* want random people subscribing and spamming your members. Your mail server will likely end up blacklisted.

    private_roster: List members OR List admin only

This can be set to taste. For some lists, it's important that member identity be private. For others, it's more important that the content not be associated with any particular member. 

### Archiving Options 

    archive_private: private

Downloaded archives include more complete headers which can be used to glean source domains, especially if DKIM headers aren't removed. It's recommended that archives be private if not disabled entirely.

## Remove DKIM headers

[DomainKeys Identified Mail](http://www.dkim.org/) (DKIM) lets an organization take responsibility for a message that is in transit. The organization is a handler of the message, either as its originator or as an intermediary. Their reputation is the basis for evaluating whether to trust the message for further handling, such as delivery.

**DKIM can undermine your goals of anonymity.** DKIM-signed messages can reveal a subscriber's domain name. For large providers like Gmail or Yahoo! this isn't too revealing as they have millions of users, but for smaller vanity domains that might only service a single user it could be more illuminating (and embarrassing).

**Running an anonymous mailing list will break DKIM signatures.** When DKIM signatures can't be verified, delivery to the end user may be denied and your mail server may be throttled or flagged as behaving badly.

**That doesn't mean you should disable DKIM.** DKIM is useful. Signing your messages contributes toward being a good netizen and also toward successful delivery. But running an anonymous mailing list will break DKIM. And it should.

Remember what Mailman's `anonymous_list` function does: we're changing the very same header fields that were cryptographically signed. Naturally the signature validation will fail. Even if we don't anonymize the list and leave the header fields alone, DKIM body checks will fail as soon as Mailman appends a list footer.

We instruct Mailman to remove inbound DKIM headers by editing `/etc/mailman/mm_cfg.py`:

    REMOVE_DKIM_HEADERS = Yes

Restart Mailman.

[Some may disagree with this](https://wiki.list.org/DEV/DKIM), but when you re-send an email through a list server you're effectively taking responsibility for the message and its recipients. It's *your* MTA that will be seen as originating the message. In many cases, we're altering and appending to the content so it makes sense that we take responsibility. Postfix will still sign the outbound message using DKIM, asserting that your mail server is taking responsibility for the message in its entirety.

## Postfix configuration

### Strip SPF headers

[Sender Policy Framework](http://www.openspf.org/) (SPF) can be a useful tool for combating spam, but it can inadvertently reveal the original sender of an email. For an anonymous mailing list, this poses a problem.

If you're using [pypolicyd-spf](https://launchpad.net/pypolicyd-spf) or some other SPF policy daemon, you might see lines like this in your mail headers.

    Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=2607:f8b0:4002:c05::22e; helo=mail-yw0-x22e.google.com; envelope-from=username@gmail.com; receiver=anonymous-list@example.org

The `envelope-from` field reveals the poster (username@gmail.com) and this header will be distributed to all list members!

Because we're taking responsibility for this now-anonymized and altered content, we can remove the `Received-SPF` header from outgoing messages. In `/etc/postfix/header_checks`, add the following line and change the `receiver` value to reflect the address of your list.

    /^Received-SPF.*receiver=anonymous-list@example.org/ IGNORE
    
In Postfix parlance, `IGNORE` deletes the current line from the input, and moves on to inspect the next input line.

If not configured already, configure Postfix to perform header checks by adding the following line to `/etc/postfix/main.cf`:

    header_checks = regexp:/etc/postfix/header_checks

Reload Postfix.

## Evidence

Anonymous mailing lists aren't truly anonymous, especially to the mail server administrator.

The identity of a poster will appear in Mailman logs, for example within `/var/log/mailman/post`:

    post to anonymous-list from Example User <example@gmail.com> anonymized
    
It's generally a good idea to keep these logs around, for troubleshooting, handling any incidents of abuse, or potential legal inquiries. On the other hand, it'd be trivial to find and replace the poster's name and email address with hashed values.

The identity of a poster will also appear in the Postfix logs. The Postfix queue manager will absolutely reveal a message's sender; the SPF policy daemon and other content filters (like [Amavis](https://www.amavis.org/)) will likely do the same.

    policyd-spf: None; identity=helo; client-ip=2a00:1450:400c:c01::22c; helo=mail-wj0-x22c.google.com; envelope-from=example@gmail.com; receiver=anonymous-list@example.org
    policyd-spf: Pass; identity=mailfrom; client-ip=2a00:1450:400c:c01::22c; helo=mail-wj0-x22c.google.com; envelope-from=example@gmail.com; receiver=anonymous-list@example.org
    postfix/qmgr: 8FF054A04: from=<example@gmail.com>, size=4466, nrcpt=1 (queue active)
    amavis: Passed CLEAN {RelayedInbound}, [127.0.0.1] [2a00:1450:400c:c01::22c] <example@gmail.com> -> <anonymous-list@example.org>, Message-ID: <8cfe9ba47212bed47a4f75bcea819a29@mail.gmail.com>, mail_id: Guv1T-zpvNAH, Hits: -0.099, size: 3701, queued_as: 8FF054A04, 447 ms

Like the Mailman logs above, it's a good idea to keep these around for troubleshooting. Over time these logs are typically rotated and disposed of, but should further scrubbing be required you could retrieve a list of anonymized posters from the Mailman logs and use that to replace references with hashed values.

Should you need *actual* anonymity, an email-based mailing list isn't the way to go about it.

