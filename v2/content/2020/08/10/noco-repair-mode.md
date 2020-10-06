<!-- title: NOCO GENIUS Repair Mode -->
<!-- categories: howto -->
<!-- tags: noco,genius,battery -->
<!-- published: 2020-08-10T09:30:00-05:00 -->
<!-- updated: 2020-08-10T09:30:00-05:00 -->
<!-- summary: Recovering a dead hybrid accessory battery using NOCO GENIUS 5 charger. -->

# NOCO GENIUS Repair Mode

ℹ️ As an Amazon Associate I earn from qualifying purchases. ([details](/v2/affiliates.html))

Taking the Repair mode for a spin using a [NOCO GENIUS 5](https://amzn.to/2BCVjce), attempting to recover an old battery. This is a follow-up to my previous [review of the NOCO GENIUS charger/tender series](/v2/2020/08/01/noco-genius.html).

The accessory battery from a friend's Toyota hybrid was dying as soon as the hybrid system was disabled. He had already replaced the battery, so it had already been disconnected and removed from the vehicle. Perfect candidate for experimenting with the NOCO GENIUS charging and repair modes.

<a href="https://www.flickr.com/photos/techmsg/50198950116/in/dateposted/" title="Panasonic S5523R Hybrid Battery"><img src="https://live.staticflickr.com/65535/50198950116_29e70436e9_z.jpg" width="640" height="480" alt="Panasonic S5523R Hybrid Battery"></a>

The battery was a Panasonic S55D23R, offering 335 CCA and 51 Ah. Not hugely capable, but its only responsibilities were starting the hybrid system and running 12V electronics when the hybrid system was disabled. It lived in a sheltered compartment in the trunk, so despite being old it was impeccably clean.

## Initial Measurements

I used a multi-meter to measure battery voltage before starting.

<a href="https://www.flickr.com/photos/techmsg/50189009628/" title="Dead 12 Volt Car Battery"><img src="https://live.staticflickr.com/65535/50189009628_c6bb801991_z.jpg" width="640" height="480" alt="Dead 12 Volt Car Battery"></a>

The battery was producing 4.54 volts DC (VDC). That's pretty danged dead.

## Normal Charge

NOCO recommends running a battery through a normal charging cycle before attempting to repair.

Connect the positive clamp, then the negative, then plug in the charger.

Note: I plugged the charger into an inexpensive [power meter](https://www.amazon.com/gp/product/B00E945SJG/?tag=v2mdc-20) to observe the voltage, amperage, power, and total kWh used throughout the charging and subsequent repair process.

<a href="https://www.flickr.com/photos/techmsg/50189009618/in/dateposted/" title="Measuring Battery Charging Current"><img src="https://live.staticflickr.com/65535/50189009618_d36701b6a4_z.jpg" width="640" height="480" alt="Measuring Battery Charging Current"></a>

The battery in question was a standard lead-acid (read: non-AGM, non-lithium) variety so I pressed the Mode button once until the 12V indicator illuminated. Charging commenced shortly afterward.

I didn't shoot a video, but with power meter you can watch the current pulse. The battery will take 0.5A for a second or two, then 0.7A for another second or two, and then back to 0.5A. And as the charging process progresses the amperage levels increase gradually, but always pulsing.

The User Guide provides estimated charging times based on battery size (Ah) and a 50% depth of discharge (DOD):

* 20 Ah in 3 hours
* 40 Ah in 6 hours
* 80 Ah in 12 hours
* 100 Ah in 15 hours
* 120 Ah in 18 hours

Extrapolating, 60 Ah might have taken 9 hours. Temperature also impacts charging times. It was warm outside for the duration of the experiment. And this battery was significantly more discharged.

It took about two (2) days for the green Charge LED to be solid green, indicating charging complete. It's entirely possible it finished overnight, but I wasn't in a rush to gather exact timings. That's one of the perks of smart battery tenders, once they're done with the charge you can leave them connected indefinitely without worry or harm.

I unplugged the charger and took a reading with the multi-meter: the battery was producing 13.16 VDC. An hour later with the clamps still on, the 13.04 VDC.

The power meter reported a range in power between 2 and 93.6 watts during the charging period, consuming 0.946 kWh in total. From my utility company, that represents around $0.11 worth of electricity.

## Repair Mode

With the battery charged, it was time for repair mode.

Press and hold the Mode button for 3 seconds until the 6V LED illuminates, then press the Mode button once more to switch to 12V Repair mode. A red LED will illuminate.

The repair mode lasted about four (4) hours, just as the User Guide suggested. Toward the end I could hear the [quiet bubbling sounds of electrolysis](https://homebatterybank.com/is-it-normal-for-my-battery-to-bubble-when-charging/) emanating from the battery; no steaming, venting of gases, or warmth to the battery casing. The charger returned to Standby mode after completion.

The battery was producing 13.20 VDC.

The power meter reported a range in power between 2 and 18.3 watts during the charging period, consuming 0.046 kWh in total. From my utility company, that represents around $0.005 worth of electricity.

## Subsequent Measurement

To see how the battery was holding the charge, I took measurements for a few days after completing the repair.

* 0 hours: 13.20 VDC
* 24 hours: 12.94 VDC
* 48 hours: 12.84 VDC
* 72 hours: 12.77 VDC
* 96 hours: 12.73 VDC

The battery appears to be losing 1-2% of its initial charge every day. If discharge continues at that rate, the vehicle would need to be driven (or battery otherwise recharged once per week) to stay in usable condition. I wouldn't use it as a primary battery in a vehicle, but left tended it could be put into "service" as a backup battery should my friend run into trouble with his new battery.

