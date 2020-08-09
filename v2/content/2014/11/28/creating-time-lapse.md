<!-- title: Creating Time-Lapse Video -->
<!-- categories: howto -->
<!-- tags: video,time lapse,youtube,gopro,imovie,zeitraffer -->
<!-- published: 2014-11-28T09:39:00-05:00 -->
<!-- updated: 2016-11-25T08:45:00-05:00 -->
<!-- summary: A brief tutorial on creating time-lapse video with a GoPro camera, Zeitraffer, and iMovie. -->

# Creating Time-Lapse Video

I've been shooting and stitching a lot of time-lapse frames together lately, in a variety of environments, a mix of business and pleasure. A few example videos from my [YouTube playlist](https://www.youtube.com/playlist?list=PLBm3S-aCMv3SLd0P5eUh_WxYY7ndEQMdL) follow.

* [Super Art Fight 100](https://www.youtube.com/watch?v=UCXOkGh14vI)
* [Leaving Saint Thomas](https://www.youtube.com/watch?v=V2cZ1iXeixE)
* [Leaving Saint Maarten](https://www.youtube.com/watch?v=laoMweE5Puk)
* [San Jose Dusk](https://www.youtube.com/watch?v=E1mHu2PYKnM)
* [San Jose Night to Day](https://www.youtube.com/watch?v=sKZugTRkxAk)
* [Keep Calm and Gobble On](https://www.youtube.com/watch?v=k0VW5L6x6yE)

Without any formal training, there was a lot of trial and error involved. What follows is the basic procedure I use to create time-lapse video.

## Collecting the Imagery

I tend use the following gear:

* [GoPro HERO3+ Silver Edition](https://www.amazon.com/dp/B00F3F0EIU/?tag=v2mdc-20)
* [GoPro HERO3 Skeleton Housing](https://www.amazon.com/dp/B00CSQYVWM/?tag=v2mdc-20)
* [GoPro Jaws Flex Clamp Mount](https://www.amazon.com/dp/B00F19Q2R0/?tag=v2mdc-20)
* USB power adapter

The battery on the GoPro only lasts a couple hours, so the skeleton housing is key for long (read: 6-8 hours) shoots; just plug in AC power and you're good to go. It also protects the lens against spit, sweat, and splashed beverages, something the open frame can't provide.

I use the time-lapse function on the GoPro, the only settings I tweak are around image quality and interval.

### Image Quality

5 MP images are more than sufficient for creating high-definition (1920x1080) videos for upload to YouTube, but they aren't super-wide, so I go with 7 MP.

10 MP images are too much, it creates extremely large (resolution) files that:

* reduce the number of stills your camera can hold
* increase the transfer time from the camera
* creates larger intermediate video
* end up being downsampled later, which takes longer

If you want to create 4K video you'll want to stick with the higher resolutions, although to date there really aren't a lot of platforms where you can tell the difference.

### Interval

Calculating interval is a function of how long the final video needs to be and how smooth the motion needs to be. Most folks won't watch a video longer than a minute or two unless they're really engaged in the content or have something specific they're measuring (i.e. [foot traffic at a conference booth](https://www.youtube.com/watch?v=8KbXxE-7yao)). I aim for the final video being somewhere in the 1.5 to 2 minute range.

For landscapes the interval can be a lot longer than for people-motion, say 30-60 seconds. For people-motion I usually go with a 10 second interval, although for short clips I may go as low as 1 second. For [the turkey carving](https://www.youtube.com/watch?v=k0VW5L6x6yE), I knew it'd be a short session so I used a 0.5s interval. It's better to take more than less, since you can always drop every other frame before stitching.

There are plenty of time-lapse calculators available on the Internet, although I usually end up jotting down the figures by hand.

## Transferring the Images

I transfer all the source files to an SSD-backed disk, one folder per video. The mini-USB connection feels slower than mounting the microSD card directly, although it usually isn't worth the hassle of removing the camera from the case.

## Stitching the Stills

[Zeitraffer](http://zeitraffer.veronicasoft.com/) is a beautifully simple program that takes a folder full of stills and stitches them together, however many frames per second you choose. Zeitraffer is available from [the Mac App Store](https://itunes.apple.com/us/app/zeitraffer/id572526628?mt=12).

I usually use 30fps, but sometimes 24fps. I leave the other settings alone.

After processing, the result is a QuickTime video in 4:3 format.

## Formatting the Video

To finish the thing, I use [iMovie](https://www.apple.com/mac/imovie/) to reformat/crop the video into 16:9 (as preferred by YouTube and modern televisions).

For comparison, consider this behind the scenes mixing video: [raw 4:3](https://www.youtube.com/watch?v=8rE8rKwFTs4) versus the [cropped 16:9](https://www.youtube.com/watch?v=wPLruEuwIlc) version.

In iMovie:

1. create a new project, 16:9 format, no template
2. File >> Import >> Movies…
2. create a new event
3. import the QuickTime video that Zeitraffer generated
4. crop the video down to 16:9 format
5. Share >> Export movie

The result is a QuickTime video in 16:9 format, sans sound, but otherwise suitable for upload to YouTube.

## Adding Audio

I usually find royalty-free music on YouTube and add it after-the-fact. Nothing fancy, there.
