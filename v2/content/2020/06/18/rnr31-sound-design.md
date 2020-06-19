<!-- title: RNR 31 Sound Design -->
<!-- categories: howto -->
<!-- tags: sound,design,rnr,microphones -->
<!-- published: 2020-06-18T23:00:00-05:00 -->
<!-- updated: 2020-06-18T23:00:00-05:00 -->
<!-- summary: High level sound design for RNR 31 including gear list. -->

# RNR Sound Design

Rock 'N Roll Revival (RNR) is a two act variety show performed in, produced by, and run primarily by high school students.

Over the past couple years I've been responsible for RNR sound design. Despite many years in-house experience, seeking advice from and learning from those in the industry, I don't consider myself a professional. One perk of a long-running show is that we have flexibility to try new things, experiment with new technologies and equipment, and my students and I get to learn together.

The following provides an overview of the sound design for RNR 31.

Note: None of the products described have been sponsored. If you find this information useful, know that we do receive a small commission when you purchase items from Amazon using the links below.

## Signal Flow

A rough diagram of the signal flow.

<a href="https://www.flickr.com/photos/techmsg/50020827893/in/dateposted/" title="RNR 31 Sound Design"><img src="https://live.staticflickr.com/65535/50020827893_0c69e5ac59_z.jpg" width="573" height="640" alt="RNR 31 Sound Design"></a>

We use [RapcoHorizon NSPL Concert Series Snakes](https://www.rapcohorizon.com/category/84/nspl-concert-snakes) for band inputs; the enclosures are rugged, provide ample space for labeling, and tend to be more economical than equivalent Whirlwind snakes. Instrument mics flow into one of two 50-foot [12x0 mic snakes](https://www.rapcohorizon.com/product/257/nspl-12x0-all-mic-snakes) on either side of the band deck whose tails are patched into a 150-foot [24x8 main snake](https://www.rapcohorizon.com/product/263/nspl-24x8-xlr-return-snakes) beneath; the eight XLR returns aren't utilized for this show.

<a href="https://www.flickr.com/photos/techmsg/49626336076/in/album-72157712649718376/" title="IMG_20200304_193734694"><img src="https://live.staticflickr.com/65535/49626336076_949c86d76d_z.jpg" width="640" height="360" alt="IMG_20200304_193734694"></a>

<a href="https://www.flickr.com/photos/techmsg/49631742443/in/album-72157712649718376/" title="IMG_20200306_170527971"><img src="https://live.staticflickr.com/65535/49631742443_aa953246bb_z.jpg" width="640" height="360" alt="IMG_20200306_170527971"></a>

The main snake tails are patched into a passive 48-channel splitter: one side is patched to MW console inputs, the other is patched to a stage box backstage and sent via redundant Ethernet cables to FOH.

Each audio console sets its own input levels and EQ.

Vocal mics are routed to FOH directly; leads over [Dante](https://www.audinate.com/) and backups via XLR. MW receives lead and backup vocal mixes by way of two FOH mono groups sent to the stage box; a third mono group "admin mix" is sent in a similar fashion, providing talkback, pre-show music, announcements, and the occasional sound effect.

### Front of House

Front of house (FOH) is primarily responsible for the main L/R mix, which is what the audience hears. One student is responsible for the band mix and another for vocals. Most channels are routed directly to L/R. Lead vocals, backup vocals, drums, guitars, keys, and brass are assigned to a series of DCAs so their relative levels can be adjusted and group mutes can be set/unset without having to switch pages/layers.

<a href="https://www.flickr.com/photos/techmsg/49653394993/in/album-72157712649718376/" title="IMG_20200312_204406353"><img src="https://live.staticflickr.com/65535/49653394993_7514355f90_z.jpg" width="640" height="360" alt="IMG_20200312_204406353"></a>

FOH is also responsible for a backstage monitor mix. This mix is used for talkback purposes during rehearsals, but also as a monitor mix for vocalists singing backstage to provide reinforcement or chorus.

The stage box connected to the FOH console has many configurable outputs. Through software patching, some of the outputs we configure: 

1. main L (to PA)
2. main R (to PA) 
3. main L/R sum (to dressing room)
4. aux 1 (backstage monitor)
5. mono group 1 (lead vocals, to MW)
6. mono group 2 (backup vocals, to MW)
7. mono group 3 (admin, to MW)

The FOH console has several configurable outputs on its surface as well. One of those outputs sends a main L/R sum to a [Radial TX4 Catapult](https://amzn.to/2XVxG77) snake; the thru XLR goes to our videographer to supplement room mics, the Ethernet output goes to its companion [RX4](https://amzn.to/3hix96S) in the lighting booth. On the RX4, the thru XLR is sent to self-powered loudspeakers to cover the lobby; the output XLR is patched into a small mixer whose mains are fed to a pair of [Presonus E3.5 studio monitors](https://amzn.to/3hoKdb0) allowing the lighting crew to control levels in their space.

The main L/R mix is also sent to the venue DSP (via Dante) which provides for dressing room 2, makeup rooms, and backup for the lighting booth.

### Monitor World

Monitor World (MW) handles sixteen dedicated mixes, one for each band member's in-ear monitor (IEM), as well as mixes for lead wedges, backup wedges, and recording.

<a href="https://www.flickr.com/photos/techmsg/49653931821/in/album-72157712649718376/" title="IMG_20200312_193533531"><img src="https://live.staticflickr.com/65535/49653931821_99ea1c7ee3_z.jpg" width="640" height="360" alt="IMG_20200312_193533531"></a>

IEM bus outputs are fanned into a 150' multipin cable, fanned out on the band deck, converted from XLR-F to 1/4" TRS (via a pair of [Seismic SAXT-8x5F](https://amzn.to/30Czofl) snakes), and patched into a pair of [Behringer 8-channel Headphone Amps](https://amzn.to/3cVfgI5). From the headphone amp outputs, 25-foot [1/4" TRS to 3.5mm cables](https://amzn.to/2N0yRvD) are run to each band member's station where they can plug in their own earbuds or headphones. In this model, every band member gets their own dedicated mix and can self-manage their own IEM volume levels without leaving the platform.

Wedge buses are patched directly to a nearby amp rack.

Recording bus outputs are patched into a [Behringer UMC404HD](https://amzn.to/2UFGs7g) audio interface attached to an old MacBook Pro running [Audacity](https://www.audacityteam.org/).

## Mic Selection

When selecting mics we attempt to strike a balance between quality and budget; it does no good to bring in a touring-grade line array if the inputs are crap. We utilize some school-owned equipment, but the production itself has invested in equipment over the years too. We supplement gear on-hand with rental equipment for ease, reliability, and flexibility.

### Vocals

As far as vocals are concerned, we're a [Shure](https://www.shure.com/) shop: [ULXD2/B58 handhelds](https://amzn.to/2XOuTg6) for lead vocals, [BLX288/SM58](https://amzn.to/2BOXycc) for backup vocals. In past years backups were wired [SM58](https://amzn.to/37hT6yi) but in 2020 we migrated to wireless which greatly simplified cabling requirements and provided more flexible blocking.

<a href="https://www.flickr.com/photos/techmsg/49654212172/in/album-72157712649718376/" title="IMG_20200312_193905138"><img src="https://live.staticflickr.com/65535/49654212172_93d7e4cf58_z.jpg" width="640" height="360" alt="IMG_20200312_193905138"></a>

If a vocalist needs to dance hands-free, we use a [PGA31](https://amzn.to/2BVwXuc) headset condenser microphone with [ULXD1](https://amzn.to/2XQKD2f) or [PGXD1](https://amzn.to/2XPn6hR) body pack transmitter. For mobile instruments onstage like guitars, violins, or ukuleles, we use a [WB98H/C](https://amzn.to/37rjaaw) instrument mic or [WA302](https://amzn.to/2XPQFzQ)/[WA304](https://amzn.to/2Ux33TD) instrument cable with the same transmitters.

Talkback mic at FOH is the trusty [Shure SM58](https://amzn.to/37hT6yi).

<a href="https://www.flickr.com/photos/techmsg/33341700652/in/photolist-SNhVZN" title="Photo"><img src="https://live.staticflickr.com/3903/33341700652_94a2a68f8e_z.jpg" width="640" height="373" alt="Photo"></a>

Talkback mics at MW and on the band deck are [Shure Beta 58](https://amzn.to/2XOfJHz) to further eliminate noise from wedges, although if they're not available the [Shure SM58](https://amzn.to/37hT6yi) works just fine.

### Instruments

Over the last couple of years I've slowly been upgrading our DI boxes. I'm a big fan of [Radial Engineering](https://www.radialeng.com/); no sponsorship, but their boxes are built like tanks and though designed and built for the rigors of touring they hold up to our students just as well.

For bass guitar, [Radial J48 Active](https://amzn.to/3hcyXOO).

For guitarists whose amps don't have direct out, [Radial JDX Direct Drive](https://amzn.to/2Ao7vNw). Even when buried beneath the deck within a sound-dampening enclosure, live cabs make for an uncomfortably loud experience for those backstage. If we must mic a live cab, [Sennheiser e906](https://amzn.to/2XPMq7o). AC power for guitar amps is filtered through a [Furman AC-215A power conditioner](https://amzn.to/3dfXIXg).

For ukulele and acoustic guitars with powered pickups, [Radial JDI Passive](https://amzn.to/2MP8AjS).

For keyboards and computers, [Radial ProAV2](https://amzn.to/3ffcBdw). AC power for instruments is filtered through a [Furman SS6B power conditioners](https://amzn.to/2zHkTMe).

For the drum kit:

* Kick drum - [Shure Beta 91A](https://amzn.to/2BMCAL1) or [Shure Beta 52A](https://amzn.to/37iVUeE)
* Hi hat - [Shure SM57](https://amzn.to/3cNRFch)
* Snare - [Shure SM57](https://amzn.to/3cNRFch)
* Toms - [Sennheiser E604](https://amzn.to/3cS4kLl)
* Overheads - [Shure SM81-LC](https://amzn.to/2MPK9mB), [Rode M5-MP](https://amzn.to/2B2dGqj), or [Audio-Technica PRO 37](https://amzn.to/2UzFrxD)

For percussion, [Shure SM57](https://amzn.to/3cNRFch) and/or pair of [Rode M5-MP](https://amzn.to/2B2dGqj) depending on the spread of the kit.

For brass, we use stand-mounted mics:

* Trombones - Audio-Technica AT3525 (discontinued), [Shure Beta 57A](https://amzn.to/30DXQNC), or [Shure SM57](https://amzn.to/3cNRFch)
* Trumpets - [Shure SM58](https://amzn.to/37hT6yi) or [Shure SM57](https://amzn.to/3cNRFch)
* Saxophones - [Shure SM58](https://amzn.to/37hT6yi) or [Shure SM57](https://amzn.to/3cNRFch)

Up until a few years ago we used clip-on mics like the [Audio-Technica PRO 35](https://amzn.to/37qbs0c) for brass, but we found that a) constant removal during breaks resulted in inconsistent input b) our band's physical activities did quite a number on the thin cabling despite best efforts to provide strain relief.

To reduce the amount of wiring on the band deck we don't use external power injectors; the MW console provides 48v for condenser mics, active direct boxes, and anything else onstage requiring phantom power.

And that's it!
