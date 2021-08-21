<!-- title: Ford Battery Management System -->
<!-- categories: howto -->
<!-- tags: ford,battery,bms,bcm,troubleshooting -->
<!-- published: 2020-08-06T18:00:00-05:00 -->
<!-- updated: 2021-08-20T21:30:00-05:00 -->
<!-- summary: Non-functional Auto Start-Stop system on a 2017 F-150 led me to discover the Battery Management System. -->

# Ford Battery Management System

ℹ️ As an Amazon Associate I earn from qualifying purchases. ([details](/v2/affiliates.html))

The [Auto Start-Stop](https://owner.ford.com/support/how-tos/vehicle-features/energy-efficiency-and-fueling/auto-start-stop-technology.html) system on my 2017 Ford F-150 hadn't been working for a couple months. At a full stop with foot firmly on the brake, I'd see an "Engine On due to Vehicle Charging" message on the dashboard display.

This nagging message, some driveway troubleshooting, and a few visits to my dealer's service department led me to discover Ford's Battery Management System (BMS).

<a href="https://www.flickr.com/photos/techmsg/50148249566/in/dateposted/" title="Engine On due to Vehicle Charging"><img src="https://live.staticflickr.com/65535/50148249566_1cd3ccdbd5_z.jpg" width="640" height="480" alt="Engine On due to Vehicle Charging"></a>

There are many conditions that can cause Auto Start-Stop to be disabled, listed on page 173 of the [Owner's Manual](http://www.fordservicecontent.com/Ford_Content/Catalog/owner_information/2017-Ford-F-150-Owners-Manual-version-2_om_EN-US-EN-CA_12_2016.pdf) (PDF), and many of which with their own message that I've seen during the course of normal operation.

* Engine Off
* Engine On Normal Operation
* Engine On due to Engine Warming
* Engine On due to Heating/Cooling
* Engine On due to Low Temperature
* Engine On due to Steering Wheel Maneuvering
* Engine On due to Vehicle Charging
* Engine On due to Vehicle Maneuvering
* Engine On due to Accessory Usage
* Engine On due to Outside Air Temp
* Engine On due to Selected Gear
* Engine On due to Steep Grade
* Engine On due to Driver Door Opened
* Engine On due to Driver Belt Unbuckled
* Engine On due to Power Outlet in Use
* Deactivated by Driver
* Auto StartStop Not Available
* Auto StartStop Manual Restart Required

The [2017 Fusion Owner's Manual](http://www.fordservicecontent.com/Ford_Content/vdirsnet/OwnerManual/Home/Content?bookCode=O34125&countryCode=USA&languageCode=en&marketCode=US&viewTech=IE&chapterTitleSelected=G1525715&subTitleSelected=G1824543&topicHRef=G1824544&div=f&variantid=4040&vFilteringEnabled=False&userMarket=USA) has a thorough list with descriptions of each.

The three year old battery reported good voltage while the truck was running, indicating that the alternator was providing power.

Problem was, even after driving a few hours on the highway -- more than enough time for the alternator to charge the battery completely -- the condition would remain.

During a routine oil change while the vehicle was under warranty, I asked the techs to check the battery. If the battery was bad and not holding a charge, it could explain the message. They checked using a handheld tester and reported that the battery was healthy. They advised that Ford wouldn't replace a battery under warranty unless it failed "the Rotunda test" which would require 2-3 hours. They also advised that if I didn't drive the vehicle every couple days, I should put it on a battery tender. They started charging the battery using the Rotunda, but I wasn't able to wait for a complete charge. The "Engine On due to Vehicle Charging" message remained.

I drove home and put the battery on a [NOCO GENIUS5 tender](https://amzn.to/2BCVjce) for a few days; for more information, read [my practical review of the NOCO GENIUS line](/v2/2020/08/01/noco-genius.html). The NOCO was content with the state of the battery, reporting a full charge. SYNC was content with the state of the battery and stayed on, but Auto Start-Stop was still not happy. The message remained.

After a few trips to the Ford dealer, a couple overnights, here's what the service department came up with:

* healthy battery check using handheld tester
* passing Rotunda test (full charge + test in ~28 minutes)
* diagnosis that the electronic transmission fluid pump was bad (somehow not talking to the powertrain control module; this ended up being a red herring and nothing ended up being replaced)
* another vehicle was found on the lot exhibiting the same behavior (which was not a reassuring assessment or solution)

The condition still remained until the shop foreman was consulted and asked whether anyone had reset the BMS. The what? Turns out nobody had. Once they did everything functioned properly, no replacement parts required. The message went away. Auto Start-Stop functioned as if nothing had ever been wrong.

Why none of the techs assigned to my shop ticket know about BMS -- who presumably replace batteries and troubleshoot other issues with the electrical systems -- I'm not sure.

So what is BMS?

## Battery Management System (BMS)

Ford Battery Management System (BMS) -- also referred to by Ford as the [Battery Control Module](https://parts.ford.com/shop/en/us/electrical/battery-and-related-components/battery-management-system-6584925-1) (BCM) -- connects to the negative terminal of the battery and monitors current, voltage, and temperature.

<a href="https://www.flickr.com/photos/techmsg/50195242911/in/dateposted/" title="Ford Battery Control Module"><img src="https://live.staticflickr.com/65535/50195242911_57997d0615.jpg" width="500" height="420" alt="Ford Battery Control Module"></a>

On the 2017 Ford F-150 (pictured below), the BCM is clamped directly to the negative battery post. Both negative and negative (to chassis) ground cables are bolted to the BCM via ring terminals. The BCM has markings indicating hardware and software versions/dates. A small two-wire harness exits the BCM (red/grey wires), presumably providing power and data. The (positive) [starter cable](https://parts.ford.com/shop/en/us/cable-assy-battery-to-battery-6507185-1#sectionId:4180166) runs through a [sensor assembly](https://parts.ford.com/shop/en/us/sensor-assy-6410197-1#sectionId:4180166) (not visible) that appears to be similar to a magnetic induction clamp meter.

<a href="https://www.flickr.com/photos/techmsg/50192280268/in/dateposted/" title="Negative Terminal of Battery in 2017 Ford F-150"><img src="https://live.staticflickr.com/65535/50192280268_f147bc5c6d_z.jpg" width="640" height="360" alt="Negative Terminal of Battery in 2017 Ford F-150"></a>

When battery voltage is low, BMS may disable certain sub-systems like Auto Start-Stop, heated seats, or SYNC to conserve power. The BMS can also chat with the Powertrain Control Module (PCM) to adjust behavior; for example when the battery is fully charged, the alternator may be disabled to improve fuel mileage.

From page 333 of the Owner's Manual, **emphasis** mine:

> Battery Management System (If Equipped)
>
> The battery management system monitors battery conditions and takes actions to extend battery life. If excessive battery drain is detected, the system temporarily disables some electrical systems to protect the battery. Systems included are:
>
> * Heated rear window.
> * Heated seats.
> * Climate control.
> * Heated steering wheel.
> * Audio unit.
> * Navigation system.
> 
> A message may appear in the information displays to alert you that battery protection actions are active. These messages are only for notification that an action is taking place, and not intended to indicate an electrical problem or that the battery requires replacement.
>
> After battery replacement, or in some cases **after charging the battery with an external charger, the battery management system requires eight hours of vehicle sleep time to relearn the battery state of charge**. During this time your vehicle must remain fully locked with the ignition switched off.
>
> Note: Prior to relearning the battery state of charge, the battery management system may temporarily disable some electrical systems.

So after tending the battery, you might not be able to disconnect the leads and go without seeing an error message, instead you might need to let the vehicle sleep for 8 hours.

When the manual says "in some cases" it's might be referring to batteries charged improperly by connecting to the battery negative post.

> Electrical Accessory Installation
>
> To make sure the battery management system works correctly, **do not connect an electrical device ground connection directly to the battery negative post**. This can cause inaccurate measurements of the battery condition and potential incorrect system operation.

Further evidence on page 298 of the Owner's Manual (jump starting) solidifies this point:

> Make the final connection of the negative (-) cable to an exposed metal part of the stalled vehicle's engine, away from the battery and the fuel injection system, or connect the negative (-) cable to a ground connection point if available.

In short, NEVER ATTACH ANYTHING DIRECLY TO THE BATTERY NEGATIVE TERMINAL besides a multimeter. Not a jump starter pack, not a battery charger, nothing. While you probably won't _damage_ anything with a modern battery charger/tender, you might cause the Battery Management Systems to complain to the point where it needs a hard reset.

The correct(ish) way to charge a Ford F-150 with BMS ([video](https://www.youtube.com/watch?v=CFZRSaiS-0M)), although I'd prefer a different ground point.

<iframe width="560" height="315" src="https://www.youtube.com/embed/CFZRSaiS-0M" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Symptoms

With Auto Start-Stop not dis-engaged (via dash button) and foot on the brake, you will see the grey "A" Auto Start-Stop icon with a slash through it and an "Engine On due to Vehicle Charging" message on the dashboard console.

Phantom loads are a plague of modern vehicles. "Drive more," says my service writer, "we've got cars on the lot whose batteries are dead after a few days." I hope that's an exaggeration, but during the 2020 pandemic shutdowns it wasn't uncommon for vehicles to sit unused for longer periods; when vehicles *were* driven, they tended to be used for shorter trips to collect essential supplies during which the alternator wouldn't have had much time to recharge the battery.

If you've taken a reading using a multimeter and find the battery to have [proper voltage](https://carbatteryworld.com/car-battery-voltage/) both at rest (>= 12.6 volts) and when being charged by the alternator (>= 13.5 volts) and you STILL see the "Engine On due to Vehicle Charging" message, BMS might need to be reset. Particularly after an improper charge, jump start, or particularly low battery state.

Seeing a "System Off to Save Battery" message on [SYNC](https://www.ford.com/technology/sync/sync-base/) when unlocking the vehicle or opening the door is a clear indicator that your battery voltage is low. Once the battery is charged (verified by multimeter), the message should go away. But if the "Engine On due to Vehicle Charging" message remains, BMS might need a reset.

## Resetting Ford BMS

According to a service writer at Ford, the Battery Management System was not designed to be user serviceable.

### Ford Service

From the workshop manual on Battery Replacement, referenced by a kind Ford technician on the Internet:

> If the vehicle battery is replaced, it is very important to perform the battery monitoring system reset using the scan tool. If the battery monitoring system reset is not carried out, it holds the old battery parameters and time in service counter in memory. Additionally it tells the system the battery is in an aged state and the (sic) may limit the Electrical Energy Management system functions.

Under warranty, this should be a simple one. Assuming that your battery is holding a charge and you've verified this using a multimeter, ask that the battery be checked, alternator output be checked, and if both are good then to reset the BMS. It's useful to stress that the "engine on due to vehicle charging" message remains even after a full charge or driving for an extended period.

Out of warranty, I've read reports of Ford owners being charged 45 minutes labor to reset BMS; pricey for a reset procedure that takes less than one minute to perform with the scan tool. Your mileage may vary, depending on the shop.

### Independent Shop

[Snap-on diagnostic tools can be used](https://www.snapon.com/Diagnostics/US/KB/DQT-AA-Ford-Battery-Monitor-System.htm) ([video](https://www.youtube.com/watch?v=IAtOIFr7bXA)) to reset the Battery Monitor System.

After the vehicle is loaded:

1. Scanner
2. Body Control Module
3. Functional Tests
4. Battery Monitor System (BMS) Reset

Follow the instructions.

### Self (using diagnostics)

FORScan can be [downloaded](https://forscan.org/download.html) and used with an [OBDLinkEX USB](https://amzn.to/2PikOmp) ($49) or [OBDLink MX+ Bluetooth](https://amzn.to/315grAI) ($99) adapter to reset BMS ([video](https://www.youtube.com/watch?v=iFdh5k4b6mo)), similar to Snap-on.

<iframe width="560" height="315" src="https://www.youtube.com/embed/iFdh5k4b6mo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

And a [video of the results](https://www.youtube.com/watch?v=045qebXe4Po).

The OBDLink adapters aren't _inexpensive_, but could quickly pay for themselves if you're doing any sort of routine diagnostics.

### Self (using Konami codes)

Many vehicles have reset procedures that can be taken by consumers without diagnostic tools. These two methods have been mentioned on several Ford owner's forums and YouTube videos with reported success.

**Method #1** involves the use of rear foglight button, which is not standard on US models. 

1. Turn on ignition (within 10 seconds)
2. Press rear fog lamp switch 5 times
3. Press hazard switch 3 times
4. Battery symbols on dashboard should flash 3 times

According to [YouTube comments](https://www.youtube.com/watch?v=4-Uaf8lNcNo) at time of writing, this process has been confirmed to work on 2010 Everest, 2012 Focus 1.6 TDI, 2013 Galaxy MK2, and 2016 Focus Diesel.

**Method #2** is for those in US markets or without a rear fog lamp switch.

1. Get in vehicle, close doors
2. Turn on ignition (but don't start)
3. Wait for battery light to come up
4. Flash brights 5 times
5. Press and release brake 3 times
6. Battery symbol on dashboard should flash after 5-10 seconds

The same YouTube commenters confirm this process works for the 2011 Edge, 2013 Fusion, 2014 Escape, 2016 Ford F-150, 2016 Edge, and 2017 Explorer.

I haven't yet had the opportunity to test the efficacy of either method, but I'd consider trying them if the 8 hour sleep period after charging/tending weren't successful.

**Update 10/06/20**: I've tested and confirmed that Method #2 works on my 2017 Ford F-150!

🆕 **Update 08/20/21**: A reader has confirmed that Method #2 works on his 2018 Ford F-150. Thanks, Philip!

## References

There's a lot of information out there. While it's always best to start with the Owner's Manual, owner forums can often highlight passages that went unread.

* [2017 F-150 Owner’s Manual](http://www.fordservicecontent.com/Ford_Content/Catalog/owner_information/2017-Ford-F-150-Owners-Manual-version-2_om_EN-US-EN-CA_12_2016.pdf) (PDF)
* Ford Escape Forum: [DIY Battery Monitor System Reset](https://www.fordescape.org/threads/diy-battery-monitor-system-reset.52369/)
* Ford F150 Forum: [Replacing a battery - the new way](https://www.f150forum.com/f38/replacing-battery-new-way-231938/)
* Ford F150 Forum: [New Battery - Reset the BMS or No](https://www.f150forum.com/f118/new-battery-reset-bms-no-460039/)
* National Oil and Lube News: [Battery Management: The Challenges of a Smart System](https://www.noln.net/articles/2122-battery-management-the-challenges-of-a-smart-system)
* Snap-on: [QUICK TIP: FORD® BATTERY MONITOR SYSTEM](https://www.snapon.com/Diagnostics/US/KB/DQT-AA-Ford-Battery-Monitor-System.htm)

