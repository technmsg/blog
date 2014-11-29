<!-- title: Resetting GoPro WiFi Password Offline -->
<!-- categories: howto -->
<!-- tags: howto,gopro,wifi,passwords -->
<!-- published: 2014-07-03T10:26:00-05:00 -->
<!-- updated: 2014-11-29T16:31:00-05:00 -->
<!-- summary: How to reset a GoPro WiFi password offline. -->

# Resetting GoPro WiFi Password Offline

If you accidentally "Forget" your GoPro network from your mobile device and don't remember its WiFi password, resetting it is simple.

While GoPro provides step-by-step instructions to reset the WiFi password, it involves [(re-)registering your device](http://gopro.com/support/product-update/register-camera), which *will* result in you receiving ~~occasional~~ weekly marketing email from GoPro. It also requires Internet access, which might not be available.

We can circumvent that.

## Create Upgrade Rules Files

GoPro camera use text-based configuration files to instruct the firmware how to behave, configure various settings, upgrade software, etc. Configuring the on-camera WiFi uses these files.

Create a text file named `update.10.txt` that looks like this.

	# Camera upgrade rules file
	OPTIONS:6

Create a text file named `settings.in` that looks like this. Tweak the *ssid* and *password* fields as needed.

	{
	"current_password":"",
	"token":"",
	"wifi_ap":{
	"ssid":"your-new-ssid",
	"password":"your-new-password"
	},
	"wifi_networks":[]
	}

Place files into a directory named `UPDATE`.

## Transfer Files to Camera

Remove the microSD card from the camera and connect it to your computer using a card reader of some sort. Move the entire `UPDATE` directory into the root of your microSD card. Eject the card.

Insert the microSD card into the camera, power on the camera, wait a few seconds for the settings to be imported, and you're done.

Simple, right?

## Notes

I've only verified this procedure on a [GoPro Hero3+ Silver](http://gopro.com/cameras/hd-hero3-silver-edition) using Mac OS X 10.8.5 to generate the files, YMMV for other models and operating systems. If you've tried using other combinations, [let me know](https://github.com/technmsg/blog/issues/new)!
