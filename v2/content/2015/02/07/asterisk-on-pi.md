<!-- title: Asterisk on Raspberry Pi -->
<!-- categories: howto -->
<!-- tags: electricity,asterisk -->
<!-- published: 2015-02-07T12:44:00-05:00 -->
<!-- updated: 2020-08-09T12:44:00-05:00 -->
<!-- summary: In my continuing quest to reduce my energy footprint, I replaced a desktop sized server with a small credit-card sized computer. -->

# Asterisk on Raspberry Pi

In my [continuing quest](/v2/2015/01/27/standby-consumption.html) to [reduce my energy consumption](/v2/solar/), I decided to replace a [desktop sized server](https://www.google.com/search?q=dell+poweredge+sc440&tbm=isch) with a small [credit-card sized computer](https://www.raspberrypi.org/help/videos/).

ℹ️ As an Amazon Associate I earn from qualifying purchases. ([details](/v2/affiliates.html))

## The Server

The server was primarily used as an off-site backup server for a client. Every night the server would kick off an rsync job via cron to pull updated content from the client's on-site file server. With the advent of cloud-based storage and backup, the client no longer had a need for the rsync-based solution.

Other services running on the box included [Subsonic media streamer](http://www.subsonic.org/), a shell script [no-ip](https://www.noip.com/) DDNS updater (for Subsonic), and [my Asterisk installation](http://www.moundalexis.com/tm/2011/08/23/asterisk-with-google-voice-and-cisco-7940g/). I haven't used Subsonic in ages, preferring instead to stream Pandora. So that left Asterisk as the only real service to be migrated.

The Dell PowerEdge SC 440 is fairly energy efficient given its technical specifications, but the there's no getting around the fact that the system doesn't sleep and doesn't spin down idle disks. While the idea of backup servers waking on LAN to perform their duties is rather intriguing, it wouldn't have worked for the Asterisk server.

## The Pi

Getting going with Raspberry Pi was simple. Just buy the thing, flash the micro SD card with a system image of your choosing, and you're off!

Buying was simple enough, although I didn't do my homework and mistakenly ordered a standard SD card (the B+ uses micro SD).

* [Raspberry Pi Model B+ (B Plus) With Clear Case](https://www.amazon.com/gp/product/B00LAA91R2/?tag=v2mdc-20)
* [SanDisk Ultra 16GB UHS-I/Class 10 Micro SDHC Memory](https://www.amazon.com/gp/product/B00M55C0LK/?tag=v2mdc-20)

This lot ran $42.86 shipped via [Amazon Prime](https://www.amazon.com/gp/video/primesignup?tag=v2mdc-20).

Did I mention that [it's incredibly small](https://www.flickr.com/photos/techmsg/16279746717/)?

<a href="https://www.flickr.com/photos/techmsg/16279746717/" title="Raspberry Pi B+ by techmsg, on Flickr"><img src="https://farm8.staticflickr.com/7293/16279746717_355a373726_z.jpg" width="640" height="360" alt="Raspberry Pi B+"></a>

I decided to run [RasPBX](http://www.raspberry-asterisk.org/about/), a version of [FreePBX](https://www.freepbx.org/) (built on [Asterisk](https://www.asterisk.org/)) specifically designed to run on Raspberry Pi. Isn't open source amazing?

I followed [the instructions](http://www.raspberry-asterisk.org/documentation/) to [flash the SD card](https://elinux.org/RPi_Easy_SD_Card_Setup#Flashing_the_SD_card_using_Mac_OS_X) with the [RasPBX image](http://www.raspberry-asterisk.org/downloads/) (which takes several minutes), inserted the card, applied power, and the thing booted right up. I did the post-install via SSH, without a monitor; the plan is to run the Pi headless, so I figured I should start out that way.

Working with the Pi B+ feels like any other Linux server, aside from being slightly less responsive (understandable, given its single 700 MHz core and 512 MB memory) and running silently. It was trivial to expand the partition size using existing tools, configure a static IP, and get key-based authentication working; getting exim4 to work with Verizon's SMTP relays might be a little more tricky. I don't plan to spend much time administering the thing, so I'm hoping I won't have to learn too many of Ubuntu's quirks.

## The Telephony

Configuring FreePBX took a little bit of discovery since I was used to editing Asterisk configuration files directly, but it took *far* less time to get working than building Asterisk from source (required back in 2011 for chan\_gtalk support, which [has since been deprecated in favor of chan\_motif](https://wiki.asterisk.org/wiki/display/AST/Calling+using+Google)).

Since I still had the old server on the network, I did have to change the Cisco 7940 configuration to use the Pi. I've yet to cut over the TFTP server, but it looks like it'll be fairly straightforward.

I also wanted my cordless phones to be used alongside the SIP handsets, both for inbound and outbound calls. Previously they could be used to place/receive Google Voice calls using an [OBi100 VoIP bridge](https://www.amazon.com/gp/product/B004LO098O/?tag=v2mdc-20), but at the expense of Asterisk not receiving inbound calls (due to conflicting XMPP priority).

As it turns out, the OBi100 is an incredibly versatile piece of hardware. Not only can it act as an XMPP client, it can act as a SIP client too. I should have figured. By [configuring the OBi100 to act as an extension](https://wiki.freepbx.org/pages/viewpage.action?pageId=4161592), I get the desired behavior. Note that the instructions reference the [OBi110](https://www.amazon.com/gp/product/B0045RMEPI?tag=v2mdc-20), but work fine with the OBi100.

The end solution in Asterisk looks like this:

* the OBi100 is configured as extension 100
* each Cisco handset is configured with two SIP lines (e.g. extension 102 & 112), one that will be used for inbound trunks and one for general usage
* Ring Group 600 is configured for extensions 100, 102, 104
* inbound trunk GV goes to Ring Group 600, thereby ringing all handsets

The OBi supports conference and transfers, so any handset can transfer a call to another. If I'm on a conference call and want to move around, I can easily transfer the call to a cordless phone; or vice versa, if I take a call on a cordless and want to transfer it back to a quality speakerphone.

And as usual, all the niceties with Asterisk such as music on hold, conference bridging, call forwarding, IVR, etc. are still available. Nothing has changed there, but it's now running on a smaller hardware footprint. As far as Asterisk performance is concerned, I haven't noticed a difference in call quality or latency. It just works.

Special thanks to Josh and Emily for assisting with trunk testing.

## Energy Impact

With the transition from a desktop server to a Raspberry Pi, I didn't lose any functionality that I cared about. In fact, with the reconfiguration of the OBi I actually have improved functionality.

While [power figures on the Pi](https://raspi.tv/2014/how-much-less-power-does-the-raspberry-pi-b-use-than-the-old-model-b) are available, there's no substitute for checking out actual usage as installed. So I pulled out the [power meter](https://www.amazon.com/gp/product/B00E945SJG/?tag=v2mdc-20) to verify. While idle:

* the Dell PowerEdge SC 440 consumes 100W, or 72 kWh ($9.36) per month
* the Raspberry Pi B+ consumes 1.6W, or 1.5 kWh ($0.20) per month

It's not a fair comparison, but given that I don't *need* those extra drives anymore, I'm happy to say that with the reduction in my electric bill the Pi will handily pay for itself about 4 months.

And did I mentioned that it's really small and cool? :)
