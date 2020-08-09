<!-- title: Verizon's Residential SMTP Blocking and Postfix -->
<!-- categories: howto -->
<!-- tags: verizon,smtp,postfix,sendmail,relay -->
<!-- published: 2015-01-28T10:26:00-05:00 -->
<!-- updated: 2020-08-09T10:26:00-05:00 -->
<!-- summary: Configuring Postfix to use Verizon SMTP relay servers. -->

# Verizon's Residential SMTP Blocking and Postfix

Note: Verizon has [retired their verizon.net email service entirely](https://www.verizon.com/support/residential/email?CMP=OTC_CON_OTH_22222_NA_20180328_NA_NM201800032_000013). This page remains for historical purposes only.

Several years ago, in 2010, Verizon decided to block outgoing SMTP connections from their residential customers in an attempt to reduce [zombie spam](https://en.wikipedia.org/wiki/Zombie_%28computer_science%29). For those running Linux servers at home, it took [a little bit of effort](http://www.moundalexis.com/tm/2010/10/28/getting-past-verizons-residential-smtp-block-with-sendmail/) to get mail to flow through their SMTP relay.

At some point Verizon stood up a new SMTP relay at smtp.verizon.net, then decommissioned outgoing.verizon.com in March 2014.

March 25th to be exact, since that's when I stopped getting email from one of the boxes I look after. I just noticed this week (some nine months later), so apparently I'm not looking after it too well. Oops.

## Sendmail Sucks

Changing the relay host (or "smart host" in Sendmail parlance) is simple enough, but the new SMTP relay requires the connection to be authenticated using [SASL](https://en.wikipedia.org/wiki/Simple_Authentication_and_Security_Layer) *and* protected by SSL/TLS. Smart idea, but [a little more difficult to implement using Sendmail](https://forums.verizon.com/t5/Verizon-net-Email/Change-to-smtp-verizon-com-from-outgoing-verizon-com-sendmail/td-p/618153).

After following several sets of instructions intended to get Sendmail connected to a local [stunnel](https://www.stunnel.org/index.html) instance, I kept ending up looking at the following [mail loop error](https://www.scalix.com/forums/viewtopic.php?f=2&t=30200):

	SYSERR(root) config error: mail loops back to me (MX problem)

After spending a few hours finding a dozen ways that it *didn't* work, I determined the way that Sendmail interprets a server's hostname (and how it decides whether or not to forward through the smart host) is positively maddening.

I threw in the towel, installed [Postfix](http://www.postfix.org/), and was up and running in less than 10 minutes. Having used Postfix for more than a decade, I should have known better than to mess with Sendmail.

## Postfix Rocks

What follows is largely from [a decade-old old relay forum](https://www.dslreports.com/forum/remark,15963982?hilite=mail+server), explained a little more thoroughly. The examples assume Red Hat or CentOS, but the Postfix configuration pieces should be fine no matter your operating system.

Install Postfix and stunnel, then enable Postfix's startup scripts:

	# yum install postfix stunnel
	# chkconfig --add postfix
	# chkconfig postfix on

One of the best things about Postfix is the human-readable and well documented configuration files. If you're coming from Sendmail, you might want to sit down.

Edit `/etc/postfix/main.cf` to configure a relay host and enable SASL auth. The number of changes are incredibly few.

	relayhost = [127.0.0.1]:2525
	smtp_sasl_auth_enable = yes
	smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
	
Create `/etc/postfix/sasl_passwd` (substituting your Verizon credentials):

	[127.0.0.1]:2525 accountname@verizon.net:password

Create a Postfix lookup table and restrict permissions:
	
	# postmap /etc/postfix/sasl_passwd
	# chmod 600 /etc/postfix/sasl_passwd*

Create `/etc/stunnel/smtp.verizon.net.conf` to configure stunnel.

	client = yes
	foreground = no
	
	[req]
	accept = 2525
	connect = smtp.verizon.net:465
	
You can change "foreground" to "yes" to watch the inbound connections to stunnel. This can be helpful during testing.

You can either start stunnel manually or add an entry to root's crontab to start stunnel once an hour. If it's already running, the command will be ignored.

	# stunnel /etc/stunnel/smtp.verizon.net.conf

Last, do a little cleanup and start Postfix:

	# chkconfig sendmail off
	# service sendmail stop
	# service postfix start

## Troubleshooting

A few common errors you might run into, and how to fix them. These are more common if you've skipped a step or two. After making changes, you'll need to reload or restart Postfix.

In the examples below, "applesauce" is the name of the server.

	Jan 28 02:16:48 applesauce sendmail[29353]: t0S7GmmH029351: SYSERR(root): localhost.localdomain. config error: mail loops back to me (MX problem?)

You are using Sendmail.

	Jan 28 02:16:48 applesauce sendmail[29354]: t0S7Gm3l029354: localhost.localdomain [127.0.0.1] did not issue MAIL/EXPN/VRFY/ETRN during connection to MTA

Nope, still using Sendmail.

	Jan 28 03:30:25 applesauce postfix/smtp[31046]: connect to smtp.verizon.net[206.46.232.100]: Connection timed out (port 25)
	Jan 28 03:30:25 applesauce postfix/smtp[31046]: 9AB2A1D9C6E: to=<test@flatbedmoneytruck.org>, relay=none, delay=91, status=deferred (connect to smtp.verizon.net[206.46.232.100]: Connection timed out)

You've configured the Postfix relay host in `main.cf`, probably without a port, but Verizon isn't going to you let you connect via port 25.

	Jan 28 03:28:54 applesauce postfix/smtp[31042]: fatal: open database /etc/postfix/sasl_passwd.db: No such file or directory

You didn't run the `postmap` command.

	Jan 28 03:32:50 applesauce postfix/smtp[31128]: fatal: valid hostname or network address required in SMTP server description: [127.0.0.1:2525]

The relay host port goes *outside* the brackets.

* correct: [127.0.0.1]:2525
* incorrect: [127.0.0.1:2525]

This is the opposite of Sendmail's behavior. Go figure.

	Jan 28 03:32:51 applesauce postfix/qmgr[31101]: 9AB2A1D9C6E: to=<test@flatbedmoneytruck.org>, relay=none, delay=237, status=deferred (delivery temporarily suspended: unknown mail transport error)

Verify that stunnel is running and listening on port 2525.

	Jan 28 03:33:52 applesauce postfix/smtp[31145]: 2406E1D9C6E: to=<test@flatbedmoneytruck.org>, orig_to=<root@applesauce.localdomain>, relay=127.0.0.1[127.0.0.1], delay=0, status=bounced (host 127.0.0.1[127.0.0.1] said: 550 5.7.1 Authentication Required (in reply to MAIL FROM command))
	
You need to enable SASL authentication.

	Jan 28 03:37:06 applesauce postfix/smtp[31179]: 9D2B91D9C74: to=<test@flatbedmoneytruck.org>, relay=127.0.0.1[127.0.0.1], delay=1, status=deferred (Authentication failed: SASL authentication failed; server 127.0.0.1[127.0.0.1] said: 525 5.7.13 Account disabled (User disabled, contact your system administrator for details).)

You're probably trying to use a secondary account or your credentials aren't correct. Verify the credentials in `/etc/postfix/sasl_passwd` and re-generate the lookup table using `postmap`.

	Jan 28 03:59:45 applesauce postfix/smtp[31339]: 9D2B91D9C74: to=<test@flatbedmoneytruck.org>, relay=127.0.0.1[127.0.0.1], delay=1360, status=bounced (host 127.0.0.1[127.0.0.1] said: 550 5.1.8 invalid/host-not-in-DNS return address not allowed (in reply to MAIL FROM command))

Does your server's hostname resolve publicly? Verizon requires all mail envelopes have a valid return address, which means a valid [A NAME record](https://support.dnsimple.com/articles/a-record/). It doesn't appear that the record has to resolve to the host that's sending the mail, but it has to resolve to *something*.

If you aren't in a position to change your server's hostname, edit `/etc/postfix/main.cf` and configure `myhostname` to be a publicly resolveable domain name.

## Summary

To summarize, Postfix will connect to a relay host to deliver non-local mail. That relay host is actually the front-end of a stunnel client that whisks the traffic across an encrypted tunnel to Verizon's SMTP relay. Once on the other side of the tunnel, Postfix authenticates to Verizon's relay host using your credentials and the SMTP transaction occurs normally.

Never versions of Postfix can do the SSL/TLS part without the help of stunnel, but the configuration is more complex. I find stunnel simple to use, well understood, and I prefer to keep my mail server configuration as simple as possible.

After I typed this up I discovered that the topic was covered thoroughly [in the Postfix SOHO manual](http://www.postfix.org/SOHO_README.html#client_sasl_enable), in plain English. Another reason not to bother with Sendmail, the lack of sensible documentation.

Just use Postfix.
