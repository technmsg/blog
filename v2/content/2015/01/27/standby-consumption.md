<!-- title: Standby Consumption -->
<!-- categories: howto -->
<!-- tags: solar,electricity -->
<!-- published: 2015-01-27T23:12:00-05:00 -->
<!-- updated: 2015-01-27T23:12:00-05:00 -->
<!-- summary: Measuring the standby consumption of various devices in an Internet-connected household, with a few surprises along the way. -->

# Standby Consumption

After going through process of [installing solar panels](/v2/solar/) on my roof, I started to wonder about the standby consumption of various electronic devices around the house. I'd read that idle/standby/phantom consumption can add up, so I purchased [an inexpensive power meter](https://www.amazon.com/gp/product/B00E945SJG/?tag=v2mdc-20) to measure the consumption of various devices.

It took a few days here and there, caused a few disruptions to otherwise uninterrupted services, but I discovered that my idle usage wasn't nearly as high as I expected.

## Internet

Like most technology workers' homes, the Internet is an always-on staple; as such, there are a lot of devices dedicated to keep it available throughout the house:

* In the office, an [OBi100 VoIP bridge](https://www.amazon.com/gp/product/B004LO098O/?tag=v2mdc-20), VoIP handset, and an ancient [Linksys WRT54G](https://www.amazon.com/gp/product/B000BTL0OA/?tag=v2mdc-20) consume 14W.
* In the den, another VoIP handset, [Linksys N300](https://www.amazon.com/gp/product/B004T9RR6I/?tag=v2mdc-20), and [Chromecast](https://www.amazon.com/gp/product/B00DR0PDNE/?tag=v2mdc-20) consume another 14W.
* The core switch only consumes 8W, but once you include a wired router (what can I say, I love routers), FiOS battery backup, and ONT, we're up to 45W.

That's a lot of gear, but all in it consumes less than two kilowatt-hours per day. At current BGE pricing, that equates to less than $0.25/day for all network and telecommunications services, far less than the cost of the services themselves.

## Active Usage

I consume about 1 kWh per 8 hours using work-from-home electronics (laptop, monitor, computer speakers, etc) that are powered off via power strip when not in use.

I consume another 1 kWh per 8 hours of TV/stereo/streaming video usage, also powered off via power strip when not in use. In other words, it costs me about $0.03 worth of electricity to stream a movie over the Internet.

By comparison, the air humidifier I use throughout the winter consumes 0.55 kWh per day with the fan set to low speed. A small price to pay for added comfort (humid air feels warmer), reduction of static charge, and elimination of bloody noses due to dry air.

All of this is *nothing* compared to the fridge (2 kWh/day), the hot water heater, and HVAC air handler. The latter two are more difficult to measure, especially in the winter months, but spring/summer usage should reveal more.

## Surprises

There were a few surprises:

* My printer consumes 1.4W in standby and 0.1W when powered off. That was surprisingly low, but the sort of behavior I'd expect for modern eco-friendly gadgets. As it happens, I don't print that often so the thing is unplugged most of the time.
* A small Dell flat-panel monitor consumes 35-45W while in operation, 3.7W in standby, and (here's the surprise) 3.6W when powered off. Not much, but if it's connected to a headless server that you don't use more than once or twice a year, why leave it powered?
* None of the USB chargers I tested consumed anything until I plugged in an end device (both Android and Apple), which I can't quite figure out, but I ran the meter for a few days to be sure.
* A single 3-way bulb in a frequently-used living room lamp was consuming more than the entire (in use) entertainment center, and has since been replaced with a 14W CFL; it had never crossed my mind to replace that particular bulb before, despite having replaced most of the incandescent bulbs with CFL years ago.

## Conclusions

What I gathered from all these measurements -- aside from discovering a few pieces of "leaky" standby equipment (which can easily be switched off via power strip) -- was that most of our modern electronics are wildly efficient compared to big box items.

Light bulbs are quick and easy to swap out, especially while they're still being subsidized, but most of your usage will likely be from your large appliances containing heating elements or compressors.
