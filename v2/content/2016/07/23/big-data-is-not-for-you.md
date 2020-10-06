<!-- title: Big Data Isn't For You -->
<!-- categories: essay -->
<!-- tags: big data,industry -->
<!-- published: 2016-07-23T16:00:00-05:00 -->
<!-- updated: 2020-08-09T16:00:00-05:00 -->
<!-- summary: Choosing to invest in Big Data is a big deal, representing very real costs in terms of finance, personnel, and time. It's not for everyone. -->

# Big Data Isn't For You

ℹ️ As an Amazon Associate I earn from qualifying purchases. ([details](/v2/affiliates.html))

"Big Data" is a buzzword, for sure. Used heavily in academic papers, blog posts, conference presentations, and many marketing materials, Big Data means different things to different people.

For me, it's a convenient way to refer to [Apache Hadoop](https://hadoop.apache.org/) and the [multitude of software components](http://bigdata.andreamostosi.name/) and services that have sprung up around it.

If this means nothing to you, suffice it to say that it's a big industry that at its core requires a bunch of computers to work together. As an example, [IDC predicts](https://www.informationweek.com/big-data/big-data-analytics/big-data-analytics-sales-will-reach-$187-billion-by-2019/d/d-id/1325631) that the industry will be worth $187B by 2019. So, big business.

Big Data isn't for you.

OK, it might not be for you. While Big Data has been lauded by some as the solution to everything, it's not a panacea.

Choosing to invest in Big Data is a big deal, representing very real costs in terms of finance, personnel, and time. The underlying technologies are complicated and often difficult to work with. My goal isn't to dissuade people; indeed, I work for a software firm deeply involved in the industry, but rather to make people aware of what they're getting into. Setting proper expectations is critical to any project's success.

A few indicators that you might not be ready to take the plunge...

## Your Data Fits in Memory

If your data fits in a spreadsheet, use a spreadsheet.

If your data is relational and fits in memory, use a relational database.

If your data needs parsing and fits in memory, use a scripting language.

These solutions are mature, affordable, and well understood. Often, they're the right tool for the job.

Don't use a [backhoe](https://en.wikipedia.org/wiki/Backhoe) when a shovel will do. Not only is the shovel far less expensive to purchase, it's simpler to operate and the storage and maintenance needs are far easier to accommodate. There may be times when it's cogent to rent a backhoe for a few hours rather than dig all day, but even then you'll need to figure out the logistics of where the backhoe will be delivered, whether it'll fit on the job site, what the fuel costs will be, and how it will impact the surrounding environment.

Similar logistical issues face those installing distributed systems.

It's easy to adopt the [Field of Dreams](https://www.imdb.com/title/tt0097351/) mentality of "if you build it, they will come." Many organizations have data that will grow over time, and it's certainly possible that those volumes will get to the point where traditional systems start to break down. It's only natural to want to be prepared... just make sure those growth estimates are based on facts rather than hopes and dreams.

## Your Organization is Rigid

You're going to need a multidisciplinary team.

People are paramount.

Even if you architect the perfect system, you'll need a system administrator to keep things running, an operations team to handle hardware, a network guru familiar with your organization's infrastructure, someone who can decipher Java, someone SQL savvy, and that's just to get everything running and working... wait until you actually want to use the system for something.

Some organizations build a [big data team](https://hbr.org/2013/07/five-roles-you-need-on-your-bi). Others have independent groups with their own focus areas. These groups need to be able to work together and communicate freely.

There's no simple formula to calculate the number of people to make up your team, just as there's no right number of nodes to compose a cluster. The size and makeup of the team will change depending on your project's technical and business needs. If your organization can't adapt quickly to changing staffing needs, it's going to be hard.


You're going to need a champion. Someone to explain or justify to management why all of this time and money is necessary. They're going to need to understand your actual business and have the trust of the folks who run it.

## You Are Not Google

You are not Google. Or Facebook. Or Twitter. Don't pretend that you are.

In October 2014, Facebook [reported](https://research.fb.com/blog/2014/10/facebook-s-top-open-data-problems/) that it "generates 4 new petabyes of data and runs 600,000 queries and 1 million map-reduce jobs per day."

<a href="https://commons.wikimedia.org/wiki/File:Mobile_shredder_%281%29.jpg" title="Mobile Shredder on Wikimedia Commons"><img src="https://c1.staticflickr.com/9/8892/28497552915_71164e2920_m_d.jpg" width="240" height="180" alt="Mobile Shredder on Wikimedia Commons" align="right"></a>

It's great that these companies are releasing their software to the world via permissive software licenses, just bear in mind that they are attempting to solve problems several orders of magnitude larger than most businesses. 

Is it cool? Absolutely.

Is it something you need to implement to solve your problem? Probably not.

In many cases, a Big Data solution won't offer significant performance improvements when working with smaller datasets. In fact, sometimes the opposite. Put another way, don't buy a [commercial shredder](https://www.amazon.com/gp/product/B001BYSMCM/?tag=v2mdc-20) when you only need to shred a few sheets of paper each month.

## You Want Turnkey

If you're looking for a turnkey solution, turn back now.

There *are* vendors who can provide near-turnkey solutions from a hardware perspective, as long as you have sufficient power, space, cooling, and network uplinks in your data center.

However, these solutions don't usually account for the specifics of your data: loading, cleansing, processing, and analysis.

The same was true for relational databases. Sure, you could buy equipment pre-loaded with all the required software, but that wouldn't take into account how to model your data, pick optimized column types, how to label it, and the manner in which to import it, let alone how to interpret the output.

If you're seeking a quick fix, you're setting yourself up for disappointment if not failure. The most successful solutions take a considerable amount of time and effort to plan out and execute before the fruits are realized.

## You're Not Ready for Paradigm Shifts

Paradigm shifts continue to occur within the computing industry, particularly concerning the location of compute resources. From mainframes to microcomputers to desktops, then back towards bigger and faster servers, now towards consolidation using both on-prem virtualization and cloud computing providers. From calculating payroll using punch cards to providing microservices to support the Internet of Things, applications continue to shift too.

Disruption is the only constant.

It's entirely possible that some new technology will come along tomorrow that changes everything, potentially obsoleting the solution you just spent a large amount of time and money to field.

There's not much to be done about this, just be aware.

## You're Focused on Technology

Don't focus on the technology, no matter how popular it may be.

In my role as a consultant, I've sat with many organizations who have decided to invest in Big Data. They've gotten buy-in, purchased hardware, made room in their data center, and engaged consultants to get them started. After their cluster is confirmed to be properly configured and functional, they turn to me and ask "okay, what's this thing going to do?"

I can't answer that.

Hadoop is a general purpose data processing framework. It's not a magic oracle that spits out fortunes. It has no awareness of your use case. It doesn't come with predefined templates for calculating profit and loss, most popular blog post, or seeking out abnormalities in the human genome.

You need to bring your own business logic to the table. That means formulating business questions you'd like answered and being prepared to provide sources of data that could potentially help answer them. After you have all of that, we can talk about what technologies might be useful.

Be practical and realistic about how other solutions perform compared to the Hadoop equivalent. Keep an open mind. Even if you have solid reasons to stand up a cluster for specific tools like HDFS and Spark, don't automatically assume that other Hadoop tools will give you similar performance boosts. Just because it's provided as part of a commercial distribution doesn't mean it's the right tool for the job.

## Too Wide Too Fast

Many organizations go too wide too fast. They install every possible tool on their cluster instead of focusing on a use case and finding the right tool for the job.

In a mechanic's tool chest there are specialized tools for particular jobs; each tool has been designed to perform a specific task in an efficient and safe manner. It's not necessary or wise to use every tool for every job and in some cases it might make things more difficult.

It's easy to get carried away with the shiny new cluster, but tool overload can be detrimental to both cluster and team performance. Remember that you still have a finite amount of resources, both in terms of computer hardware and the ability of your folks to learn how to really use tools well.

## Closing Thoughts

Hadoop is just one tool among many in the Big Data toolbox. A complicated tool with many moving and interconnected parts that require careful planning, consideration, staffing, and funding. You can expect the same for most tools.

Just as computers and the Internet revolutionized commerce and communications worldwide, you'd be hard-pressed to find a vertical that hasn't been impacted by these technologies. The [success stories](https://www.google.com/search?q=big+data+success+stories) are out there, for sure, but that doesn't mean success comes easily or without effort.

Just because Big Data isn't for you doesn't mean there's a problem with Big Data itself. You might just not be ready... yet.

&sect;

Note: This post started as a draft email in October 2014 consisting of ten bullet points. I thought it would be the starting point for a talk to give to business management. Revisiting the draft in July 2016, it still seems relevant.

Thanks to those who provided thoughtful [peer review](/v2/2015/09/09/peer-review.html) and feedback. Special thanks to those who continue to encourage me to keep writing. You know who you are.
