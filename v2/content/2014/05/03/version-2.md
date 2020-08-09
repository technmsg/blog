<!-- title: Version 2 -->
<!-- categories: essay -->
<!-- tags: blogs -->
<!-- published: 2014-05-02T12:00:00-05:00 -->
<!-- updated: 2020-08-09T16:31:00-05:00 -->
<!-- summary: The second coming of my blog. Technically the third, but that's another discussion about semantics. -->

# Version 2

The second coming of my blog. Technically the third, but that's another
discussion about semantics.

I've been wanting to re-work my blog for some time now, for a variety of reasons, but never found the time to do so. A couple sparse weekends gave me the opportunity to brainstorm, and a few recent cross-country flights provided the time.

## Things I Wanted

* static content - no PHP, no SSI, no database, easily updated
* content to be stored on [GitHub](https://github.com), both for backup purposes and to allow for user-submitted edits, pull requests even
* ability to migrate the site to another host, with ease; `tar -zcf` and go, ideally
* ability to keep the old blog content intact, that is to say, in the same place; no doubt the search crawlers would sort out any changes eventually, but dead links suck
* to write in text, Markdown, or HTML, either remotely or on-server
* mobile-friendly, which either means dead simple HTML or mobile-aware CSS
* renewed focus on essays, technical HOWTO, and photography; ditch the rest for now 

## Things I Don't Care About Right Now

* attractive site design: to be handled by drop-in CSS later
* comments: because they suck
* search: can add Google site search later
* tags: perhaps auto-generated later, but not now
* RSS: perhaps auto-generated later (bash, Perl modules, etc), in the meantime there are plenty of site-to-RSS services out there, RIP Google Reader, etc. For now just track categories and published/updated dates.


## Decision

After fiddling with a lot of different engines, attempting to import the WordPress entries from XML, I just gave up. [Pelican](https://blog.getpelican.com/) came close, except that the template system was monstrous.

I decided I was being stupid.

Why re-import all the old stuff? Why not leave [mirror the WordPress site using wget](https://darcynorman.net/2011/12/24/archiving-a-wordpress-website-with-wget/) and serve up the static HTML?

So that's what I did. Could you tell?

The HTML is a little larger on-disk than it needs to be given all the tag and category pages, but load times are faster and load on the CPU has dropped considerable. Both WordPress and PHP have a history of security vulnerabilities, so I'm glad to be off both of them.

With the old site mirrored, I rolled [my own blog engine](https://github.com/technmsg/v2/). About 300 lines worth of Bourne shell and awk scripts, which shouldn't be a big surprise to anyone who knows me.

The upsides: it does what I want, nothing more, with a KISS kind of elegance.

The downsides: to be determined, I'm sure.

## Inspiration

* Tim Bray's [copyright](https://www.tbray.org/ongoing/misc/Copyright) page, to preserve copyright but also to license under Creative Commons, something that I've been wanting to migrate towards for a while.
* Dave Gamache's work on [Skeleton](http://getskeleton.com/), which (I hope) is a drop-in CSS styling thingy that will JustWork&trade; for me in the near future.
