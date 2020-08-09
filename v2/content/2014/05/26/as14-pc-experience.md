<!-- title: Experiences of a Program Committee Member -->
<!-- categories: essays -->
<!-- tags: accumulo,conferences -->
<!-- published: 2014-05-26T12:38:00-05:00 -->
<!-- updated: 2020-08-09T16:31:00-05:00 -->
<!-- summary: My experience on the 2014 Accumulo Summit Program Committee. -->

# Experiences of a Program Committee Member

A few months ago I was asked to be on the Program Committee for the first annual [Accumulo Summit](http://accumulosummit.com/).

While I've helped organize corporate events in the past for our employees, partners, and customers, this was my first opportunity to have a hand in planning a public conference. It was also a chance to contribute towards the development of the [Apache Accumulo](https://accumulo.apache.org) community, beyond the minor code and documentation fixes that I've contributed to date.

Here's what was involved, from my perspective. 

## Organizer vs. Committee Member

When I was asked to be on the program committee, I said sure. Why not?

I had no idea what that meant, what would be involved, or how much time it might take. Oops. After going through it, I think I've got a decent idea.

So what does the program committee do, exactly? I see them as distinct from the organizer(s). While other conferences probably do their own thing or break out responsibilities differently, I'm sure there's some similarities.

The **organizer** is responsible for the overall theme of the conference, sorting out the logistics of venue (rental, support services, audio/visual, attendee check-in, food service, etc), engaging sponsors, working with the media to do press releases, advertising the event, and probably a host of things that I've never had to think about.

In our case there were two organizers that we worked with, one each from [ClearEdge IT](http://clearedgeit.com) and Sqrrl (the two corporate hosts of the event).

The **program committee** works to develop the content of the conference, namely parsing through all the submitted presentations or talks and figuring out which ones will be accepted and which ones will be declined.

The [Accumulo Summit Program Committee](http://accumulosummit.com/program/committee/) was composed of seven individuals. Similar to the makeup of an Apache Software Foundation (ASF) incubator team, the committee was composed of a heterogeneous mix of individuals from a variety of backgrounds and employers. No employer had more than one representative. Four of the seven were committers, each an OG, and the remaining three were listed contributors to Accumulo.

## Wearing the Right Hat

When I was first invited to be on the program committee, I was told that I would have to wear my community hat. I wouldn't be representing my employer, my current consulting customer, or even myself, but rather the Accumulo community as a whole.

How did I do this?

### Blind Evaluations

Early on, I recommended to the organizer that we evaluate the abstracts in a blind fashion, that is without knowing the identity of the presenter. The community around Accumulo is quite small, where many of the prospective presenters would have been known to each other: competitors, long-term collaborators, coworkers, even friends. Even if everyone was completely committed to be impartial, we're naturally biased, so best to remove the identities from the process.

That's what we did, for the most part.

I would have liked to have done a double blind CFP -- similar to the method [B-Sides DC used](http://www.bsidesdc.org/Security_B-Sides_DC/Blog/Entries/2013/8/11_How_We_Did_a_Double-blind_CFP.html) -- where we evaluate both the abstracts and speakers independently, but we ran short on time.

### Remaining Impartial

We were also asked not to vote for our own talks. I didn't submit one myself, so that wasn't an issue for me.

Since I work alongside several engineers who work full time on Accumulo, I made them aware of my role in the conference selection process, and offered to excuse myself from our internal planning calls so that they could discuss their submissions with each other. My coworkers respected my decision and took those discussions offline rather than have me drop from the calls, but I thought it was only fair to offer.

## Talk Selection

While the conference was expected to draw many attendees with advanced knowledge of and experience with Accumulo, we were also expecting many new curious end-users, developers, and business-oriented folks. How best to represent them all? What would they want to hear about?

Selection is a lot of reading, balancing, and decision making.

The organizers sent each of us a document with abstracts, one per page, labeled with an ID number. The submitting author's identity was removed or in some cases redacted. Each member of the program committee would read the abstracts, assign a score (1-5) to the talk, and record the same on a provided spreadsheet.

After all the evaluations were completed, the scores would be averaged and we'd take the top N with the highest averages/means. Simple enough, although some of the more data science-y types recommended some algorithm to apply instead. Not sure if we ended up doing that or not.

### The Spreadsheet

The spreadsheet included a handful of columns for each talk:

* Talk #
* Overall score
* Consider for keynote? Y/N
* Comments to organizers
* Comments to pass to submitter anonymously

Also included within the spreadsheet was a key for scoring (slightly paraphrased), which I found very helpful:

	5 - definitely accept
	4 - I like it and we should try to fit it in if others agree
	3 - meh, if we have room we can have it
	2 - relevant, but has some problems (please leave comment for submitter)
	1 - I can't believe this talk was submitted, do not consider
	
## My Method

I wanted to see a decent mixture of talks, so I took to categorizing the proposals as I read through. Most of them fell into one of the following:

- success story
- how to (similar, but usually with demo)
- use case
- operations
- feature exploration
- hardcore development-fu

I started by rating every talk individually, using the provided key, without consideration of the final mixture. After the first couple, I found it difficult to keep track of what talk corresponded to each ID number, so I ended up augmenting the spreadsheet a little bit.

I added a **Summary** column, containing both the category of each talk and a brief phrase describing it, an abstract of the abstract. This allowed me to quickly skim through the list of talks without having to refer back to the complete document.

For a few abstracts I recognized the likely identity of the presenter based on his or her published work in the area, things I knew they were working on, rumors I'd heard, etc. I recused myself from these, assigning no score.

For a few others, the abstracts were written up in such a way that it was obvious the affiliation of the speaker (e.g. "working at [organization] we've developed [marvel X]"). If I didn't have a conflict of interest, I assigned a score.

Then I started thinking how to create a balanced agenda, trying to get a good mixture of content suitable for the diverse attendees. I added a **Recommended?** column to include which talks I thought should be included with this in mind. This was harder, since there were a lot of deeply technical talks and fewer suitable for newer users.

Reading, scoring, and making my selections took a couple hours.

## The Results Process

After everything was submitted, the results were tallied by the organizers and a tentative "release candidate" (RC) was sent back to the program committee for discussion via email. Some talks that received low scores were argued for, others against. There was a suggestion from the organizers about combining talks.

I'm not sure whether it's common for organizers to be involved in the talk selection at this stage, but they were, and I wasn't a fan. I understand that they were trying to promote discourse, but it felt like micromanagement. It's a fine line to walk. If an organizer is going to outsource the selection process, they ought to trust the judgement of the committee and accept their findings. To do otherwise is somewhat insulting: if my input wasn't valued, why did I bother going through all these things?

While I like the *idea* of having the opportunity to discuss the results, I'm not sure what it bought us. Perhaps fitting, some of the same headaches that stem from the consensus-driven code release process began to manifest during the selection process and following discussions.

The email discussion occurred over a period of a couple weeks, taking no more than an hour or two.

## Speaking Up

It was not clear what our role was at this point, other than to make it a good conference, so I elected to speak up about some things, publicly, to the entire committee and organizers.

I was firm about not asking presenters to combine their talks:

> I'm not usually a fan of asking presenters to combine talks, it's effectively the same as changing the expected duration after the CFP. Comes off as rude to me. 

I was concerned with the amount of technical content, and how that could be unattractive for some of our newer users:

> I see a lack of specific success stories. Plenty of use cases, technical briefs, but less "we used [widget] to accomplish [goal] and it [result]" sort of stories. Accumulo needs publicly sharable success stories; they don't have to be particularly sexy, but if a [business type] is willing to tell a story that's worth something.
	
If there are sponsors whose submissions should receive special consideration, they belong in a separate track and should be identified as such. I'm not a fan of sponsored talks, since I can always head to a sponsor's booth and *ask* them what they've been up to, or ask a sales engineer to schedule a call/demo. In any case, I think sponsored talks ought to be evaluated by the organizers and not included in the list of talks to be evaluated by committee.

I felt like I was being outspoken, putting my foot down moreso than the others. Maybe that won't get me re-invited next year. Or maybe that's just what is needed.
