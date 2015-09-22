<!-- title: A Story of OnePlus Support -->
<!-- categories: howto -->
<!-- tags: oneplus,camera,support -->
<!-- published: 2015-09-22T16:30:00-05:00 -->
<!-- updated: 2015-09-22T16:30:00-05:00 -->
<!-- summary: If your OnePlus hardware is faulty, here's what it takes to get it replaced. -->

# A Story of OnePlus Support

I bought a [OnePlus One](https://en.wikipedia.org/wiki/OnePlus_One) (OPO) on January 23rd, 2015.

I didn't really need it, but I had received an invite code and I knew that my aging [Nexus 4](https://en.wikipedia.org/wiki/Nexus_4) would need to be refreshed eventually. I liked the idea of trying out [CyanogenMod](http://www.cyanogenmod.org/) without having to flash my primary phone, so I figured *what the hell*.

When it arrived, I marveled at its size. [The OPO is big](https://www.flickr.com/photos/techmsg/20415322173/in/album-72157657793043989/). Impressively lightweight given it's dimensions, but big. So after booting it once to make sure it worked, I returned it to its original packaging and put it on the shelf.

I didn't start using my OPO until August 6th, almost eight months after I first received it. After acclimating to [Cyanogen OS](https://cyngn.com/cyanogen-os), things were great.

## Lights, Camera, Oh Crap...

The camera was fast to capture, an improvement over the Nexus 4, which I find has some focus-to-shutter lag, but **after a few days the rear camera stopped working.** If I pulled up the camera app it'd just hang there -- controls visable but with a completely black preview screen -- then eventually display "Camera error: Can't connect to the camera" ([screenshot](https://www.flickr.com/photos/techmsg/20379823140/in/album-72157657793043989/)) or crash.

<a href="https://www.flickr.com/photos/techmsg/20379823140/in/album-72157657793043989/" title="Camera error"><img src="https://farm6.staticflickr.com/5764/20379823140_040850b616.jpg" width="500" height="303" alt="Camera error"></a>

If I was quick I could switch to the front camera and take pictures successfully, but upon switching back to the rear camera I'd experience the same problem. Trying to access the camera using different applications made no difference.

It felt like a hardware issue.

But I read through [the OPO forums](https://forums.oneplus.net/forums/the-one/), sorted through all the cruft, just in case it was some weird firmware thing. I tried most of the fixes, but nothing worked, so I opened a case with [OnePlus Support](https://oneplus.net/support).

## OnePlus Support

If you're considering returning a device to OnePlus, realize that the RMA process will take a while. In my case, it took about *five weeks* from filing the support case to receiving a new device.

I still had a viable Nexus 4, so aside from the hassle of migrating a few applications back I wasn't horribly inconvenienced. If I hadn't, I could have spent *three weeks* without a phone. If the OPO *is* you primary device, you might consider keeping an old handset around as a backup.

The rough outline of the RMA process:

1. describe the problem
2. provide video of the problem
3. perform various troubleshooting steps
4. (attempted) remote troubleshooting session
5. re-flash the OPO with [OxygenOS](https://en.wikipedia.org/wiki/OxygenOS) to rule our firmware issues
6. ship the device back to the United Kingdom via DHL
7. receive a new device, shipped from California

Understandably it's in OnePlus' interest to rule out user error, software bugs, and firmware glitches before shipping a device to the United Kingdom at their expense. As such, you can expect to go through several tiers of troubleshooting just like you might when reporting a problem to your company's IT helpdesk. For technical folks, this will be frustrating.

Working across world time zones always adds some difficulties, especially in the form of delays. The OnePlus support process is no exception. Interaction with OnePlus support is almost entirely via [Zendesk](https://www.zendesk.com/) email threads. I'd typically see responses late evening New York time, but also some mornings and weekends too. I did my best not to be the source of delay, but sometimes responses would arrive after I'd gone to bed, traveling without service, etc. Even if I replied as soon as I could, I suspect some of my responses wouldn't have been seen until their next business day.

Everyone was very polite. No complaints there, at all. At no point did any representative make me feel like an idiot.

The end result was a new device being shipped to me, albeit questionably packaged. The new camera worked out of the box, before and after upgrading to CM 12.1. Hopefully this one will stay that way.

## The Email Chain

What follows is my 48-email interaction with OnePlus support, unchanged except for the redaction of accounts, case numbers, and other identifying information. I provide it so that others may know what they can expect from the OnePlus RMA process.

Your mileage may vary.

There are certainly things that OnePlus could do to improve it's support offering, some of which I muse about in the ongoing (now non-)interior monologue. If you detect cynicism, skepticism, and concerns about security, you'd be absolutely correct.

### #1

**Alex**  
Aug 15, 06:56

> After a few days normal operation, the back camera stopped responding and
issued a "can't connect to the camera" error. The preview window remains dark
and the error appears. Periodically the camera controls appear and I'm able to
switch to front-camera which takes successful pictures/video, but the
application usually becomes unresponsive ("unfortunately, camera has stopped")
and I can't switch back to back-camera.
>
> I have searched all the forums, tried everything else except flashing with a
new ROM (Oxygen, nightlies).
>
> I have tried other camera applications (Google, Twitter, Flickr, etc) with no
change. I have tried clearing application caches, uninstalling all other
applications, rebooting, powering down for 10-12 hours, factory reset, and
factory reset with removal of all media/user-data.
>
> Model: A0001  
> Cyanogen OS version: 12.0-YNG1TAS2I3  
> Android version: 5.0.2  
> Baseband version: DI.3.0.c6-00230-M8974AAAAANAZM-1  
> Kernel version: 3.4.67-cyanogenmod-gf34ed89  
> Build number: LRX22G
> 
> Picture of error included:  
> [https://twitter.com/technmsg/status/632173027359371264](https://twitter.com/technmsg/status/632173027359371264)

I tried to provide all the information they would need, rather than bouncing back and forth for days. I'm not sure whether that's an artifact of me having worked a support desk before, common sense, or some mixture of all three.

Around the same time I had [engaged support via Twitter](https://twitter.com/OnePlus_Support/status/632213812393975808) as well and they responded quickly with:

> 1. Try to disable the NuPlayer from the Developer options and restart the phone.
> 2. Hold down the volume,power & back buttons for 30 seconds.
> 3. Please uninstall the app and reinstall it.
> 4. If still doesn't work, we better suggest to please perform a factory reset [https://oneplus.net/support/answer/how-do-i-perform-a-full-factory-reset](https://oneplus.net/support/answer/how-do-i-perform-a-full-factory-reset).

I appended the results (or lack thereof) following their advice to the case.

### #2

**Alex**  
Aug 15, 06:58

> Also tried the suggestions from Twitter's @OnePlus_Support earlier today,
without any change.

### #3

**Cheyserr (OnePlus)**  
Aug 15, 14:16

> Hi Alex,
>
> Good day! Welcome to Oneplus Global Support. I'm sorry about the issue(s) that
you're experiencing on your One. For us to be able to assist you, kindly
provide a:
>
> * Video showing the problem. (can be uploaded through Google Drive/Dropbox)
> 
> Please do understand that the above requirements will help us a lot to expedite
> the assessment process. Thanks a lot!
>
> Regards,  
> Cheyserr

This much maligned process has been discussed at length within the OnePlus forums, so I knew it was coming. So they wanted a video of me picking the camera app, seeing a blank screen, and waiting for the app to hang? Not sure how helpful that will be in diagnosing the issue, but I guess it'll serve as proof.

Rather than using a camera to do this, I used the stock screen capture app that comes with Cyanogen OS to "shoot" a couple videos. I uploaded them to Google Drive, nervously shared them with the world, and sent the links back.

### #4

**Alex**  
Aug 15, 22:03

> When starting from scratch after a factory reset, the dialogue isn't
> responsive. Subsequent loads are met with "cannot connect to camera" error.
>
> [link removed]
>
> After force stop and cache clear, able to use front-camera if I'm fast enough.
>
> [link removed]
>
> After clearing Camera data/cache and disabling and re-enabling app.
>
> [link removed]

### #5

**Cheyserr (OnePlus)**  
Aug 16, 10:31

> Hi Alex,
>
> Thank you for your cooperation. I'm afraid that the video you've provided is in
> private, can you kindly change its privacy settings to public for us to view?
> Thanks in advance!
>
> Regards,  
> Cheyserr
 
Crap. Apparently the Google Apps domain I used didn't allow sharing with the world. Good thing in general, not so great here. Had to re-host the videos under a generic non-GA Gmail account.

### #6

**Alex**  
Aug 17, 20:59

> Had to move them to a different location. All three videos are included in this
> shared folder on Google Drive.
> 
> [link removed]
> 
> Thanks.

### #7

**Josh (OnePlus)**  
Aug 18, 17:08

> Hi Alex,
> 
> Thank you for providing us the required attachment!
> 
> Cheyserr is on leave, so I'm taking over to escalate this ticket to designated
> department.
>
> These videos will be a great help reference for our Technical Department to
> whom I shall escalate your concern for proper assistance and further
> troubleshooting steps.
>
> Someone will get back to you momentarily.
>
> Thanks again!
>
> Kind Regards,  
> Josh

### #8

**Ray (OnePlus)**  
Aug 19, 06:22

> Hi Alex,
>
> Thank you very much for providing us with these information. We're sorry to
> know that you still have issues with you One. We understand that you have
> already tried all basic troubleshooting steps and it still not working. In
> order for us to check if it's a software issue, you may have to flash your
> phone to Oxygen to resolve this issue.
>
> To install OxygenOS on your OnePlus One, you need to flash the device. You may
> follow the guidance of the latest update here:  
> [https://forums.oneplus.net/threads/an-oxygenos-update.317098/](https://forums.oneplus.net/threads/an-oxygenos-update.317098/)
>
> Please also note that since OxygenOS is a product from OnePlus therefore it is
> currently only available for OnePlus One.
>
> Any question or problem please feel free to come back to OnePlus Support : )
>
> Regards,
>
> Ray

I had my doubts about:

* whether a new ROM would fix what I was *reasonably certain* was a hardware problem
* leaving [Cyanogen OS in favor of Oxygen](https://www.techinasia.com/oneplus-oxygen-vs-cyanogen-review/), especially given the upcoming 12.1S OTA; if a software update can fix the thing, why not just wait for the OTA?
* flashing a ROM and bricking the device

The guidance on the forum *appeared* to be from a OnePlus staff member but included the phrase "it's beta so it's not guaranteed to work." Not cool.

### #9

**Alex**  
Aug 21, 03:19

> To help me decide whether to flash a beta ROM (something I've never done), is
> there an expected rollout for CM OS 12.1S via OTA update? now that OPT is
> shipping, are we talking days, weeks, months?

### #10

**Ray (OnePlus)**  
Aug 21, 06:55

> Hello Alex,
>
> Thank you for the quick response. We do apologize but haven't receive any
> information yet from Cyanogen on when they will rollout the CM12.1s. With
> regard to OPT, it will be on Oxygen since it is our official ROM.
>
> For the official version of the Oxygen, here is the correct link:
>
> [https://forums.oneplus.net/threads/touchscreen-issues-fix.314410/](https://forums.oneplus.net/threads/touchscreen-issues-fix.314410/)
>
> Thank you very much for your time.
>
> Regards,
>
> Ray

In other words, "we aren't supporting CM anymore."

### #11

**Zendesk**  
Aug 26, 07:03

> This is an automated email from the OnePlus Support Team regarding ticket 380694
>
> Hi Alex,
>
> Just wondering if you've had a chance to review the latest update from Raymond? Raymond provided an update some time ago, but we haven't heard back from you.
>
> The ticket is now marked as 'solved'. However, if you'd like to provide an update, or require more time to work through our latest comment, simply reply to this email to reopen the ticket.
>
> If your inquiry was resolved, this ticket will be closed in 5 days.
>
> Thanks! Have a great day!
>
> OnePlus Support

Automatically marking a case "solved" after five days without a response? Not uncommon for support desks, but crappy nevertheless.

### #12

**Alex**  
Aug 26, 08:17

> I've reviewed Raymond's response, but do not have experience flashing ROMs or
> the equipment to do so.
>
> Hope to enlist the assistance of a friend in the next couple days.
>
> Sent from a mobile device; please excuse brevity.

### #13

**Ray (OnePlus)**  
Aug 26, 08:29

> Hello Alex,
>
> Thank you very much for responding. If you'd like, you may also book for a
> remote session instead so that our Level 2 Tech Specialist will be able to
> assist you in flashing your phone.
>
> May I ask, are you using MAC or windows device?
>
> Regards,
>
> Ray

Alright, worth a shot rather than having to pester a friend.

### #14

**Alex**  
Aug 26, 08:41

> I use a tablet primary, but have an old Mac.
>
> What are the requirements for the remote session, both software and
> connectivity?
>
> Sent from a mobile device; please excuse brevity.

Read: I don't use Windows nor would I allow remote support personnel to access my primary workstation.

### #15

**Ray (OnePlus)**  
Aug 26, 08:44

> Hi Alex,
>
> Thanks for your feedback. As you are using Mac, please download these files
> before we can take the remote.
>
> Oxygen - https://s3.amazonaws.com/oneplussupport/Oxygen_150527.rar
> Android SDK for MAC ->
https://dl.google.com/android/adt/adt-bundle-mac-x86_64-20140702.zip  
> ROM ->
http://builds.cyngn.com/factory/bacon/cm-11.0-XNPH44S-bacon-signed-fastboot.zip 
> AFX ->
https://drive.google.com/file/d/0BwVwtv1me2AqTndRZ2RYbDQzNG8/view?usp=sharing
>
> There is the link to book for your preferred remote session schedule and reply
> to this email with the date and time that you booked so it can duly noted.
>
> https://www.oneplus.setmore.com - Hong Kong Time Zone
> https://www.oneplustech.setmore.com - EST Time Zone
>
> NOTICE:   
> Our Tech Support only accesses to the files/application on your PC that are
> necessary for troubleshooting. We do not and are unable to store, or disclose
> any information we have access to during this process. The whole process is
> done with the customer's presence, who has the right to terminate the process
> anytime during the process.
>
> Best regards,
>
> Ray

Hmm, no indication of minimum operating system. I refer to my old Mac as "old" because it's old. But I download the bits -- despite being from a hodgepodge of sources -- and made an appointment.

### #16

**Alex**  
Aug 26, 10:12

> Thursday 8/27 0945 Eastern
> 
> Sent from a mobile device; please excuse brevity.

### #17

**Ray (OnePlus)**  
Aug 27, 00:38

> Hi Alex,
>
> Good day!
>
> Thank you for responding. We're glad to know that you were able to successfully
> book for an appointment.
>
> During your remote session appointment, our Level 2 Tech Support will contact
> you through this ticket and will provide you with instructions on what you need
> to do during the remote session.
>
> Thank you so much for your patience.
>
> Regards,
>
> Ray

So I'm going to be stepping through it myself. Cool.

### #18

**L2 - Arvin (OnePlus)**  
Aug 27, 21:05

> Hi Alex,
>
> Just a reminder, you have a schedule remote session later today.
> Please let us know if you are available so that we can prepare our tools.
>
> Thank you.

### #19

**Alex**  
Aug 27, 21:11

> Still available.
>
> Sent from a mobile device; please excuse brevity.

### #20

**L2 - Arvin (OnePlus)**  
Aug 27, 21:29

> Hello Alex,
> 
> Thanks, please click on this link: https://113366.com?accessCode=XXXXXX  
> access code: XXXXXX
>
> Thank you

On a Guest account with limited access, I load Safari and try to pull up the provided URL. Certificate issues galore, the page won't load. Works with HTTP, autodetects my browser and OS and downloads a remote control application. Yay. :-/

Go to run the application, it won't run. Probably a newer binary than my old Mac can handle. Go figure.

### #21

**Alex**  
Aug 27, 21:40

> I'm told "you cannot use this version of the application RcEngMgr with this
> version of Mac OS X"
>
> Sent from a mobile device; please excuse brevity.

Keep it informative.

### #22

**L2 - Arvin (OnePlus)**  
Aug 27, 21:47

> Hello Alex,
>
> Thanks, actually it's compatible with Mac OS X as we have tried it with other
> customers.  
> Can you try again and try to use Safari.  
> Try this link: https://113366.com?accessCode=XXXXXX  
> access code: XXXXXX
>
> Thank you

Oh Arvin... using a different browser isn't going to correct a binary incompatibility.

### #23

**Alex**  
Aug 27, 21:50

> I have tried Safari and Firefox. The app downloads OK, but I get the error when
> I try to launch it.
>
> Believe the app requires OS X 10.6, I have 10.5.8.
>
> Sent from a mobile device; please excuse brevity.

Stay cool. Resist the temptation to point out the previous question about prerequisites.

### #24

**L2 - Arvin (OnePlus)**  
Aug 27, 21:57

> Hi Alex,
>
> Thank you, that is right, just found it, it's compatible with OS X 10.6  
> Would it be ok to ask a friend to assist you in installing the latest oxygen os
> because it has the latest firmware that will address the issue on your phone.  
> Here is the link:  
> [https://forums.oneplus.net/threads/oxygen-1-0-2-release-with-stagefright-security-patches.340711/](https://forums.oneplus.net/threads/oxygen-1-0-2-release-with-stagefright-security-patches.340711/)
>
> Thanks a lot

There are no words. Or too many, depending. Thanks a lot, indeed.

### #25

**Alex**  
Aug 27, 22:04

> I asked a friend. He says he'll help.
> 
> If it doesn't fix, what is next step?
>
> Sent from a mobile device; please excuse brevity.

They said to ask. I asked. My friend laughed, but agreed to help.

### #26

**L2 - Arvin (OnePlus)**  
Aug 27, 22:05

> Hello Alex,
> 
> Thank you, if it doesn't fix the issue, just let us know and we'll escalate it
> to our repair department.
> 
> Thanks a lot for your understanding.

Shipping a handset to Hong Kong? Meh. They're never the same once they're cracked and the possibility of getting back a refurbished unit is irritating too. At this point I'd rather just get a refund and buy a new one, hopefully one more recently off the factory line.

This was about the time I saw that Cyanogen had started rolling out [Cyanogen OS 12.1](https://cyngn.com/blog/cyanogen-os-12-1-dialed-in-turned-up) via OTA update. I downloaded it manually and applied it via the stock bootloader.

Big surprise, it didn't fix the camera.

Later that night, I had a friend help me unlock the handset. We flashed [Oxygen OS 1.0.2](https://forums.oneplus.net/threads/oxygen-1-0-2-release-with-stagefright-security-patches.340711/) using [the OnePlus-provided instructions](https://forums.oneplus.net/threads/oxygenos-is-here-installation-guide.289398/). Oxygen OS is a very slim build of stock Android, very quick and responsive, but the problem with the camera remained.

### #27

**Alex**  
Aug 28, 10:21

> I had a friend help me flash Oxygen 1.0.2 using the supplied instructions.
>
> No change, unfortunately. When loading camera, I immediately get the "cannot connect to camera" error message (just like with CM 12.0 and CM 12.1). :(
>
> Time to escalate for warranty repair?

Then it got quiet.

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Pretty decent response time from <a href="https://twitter.com/oneplus">@oneplus</a> <a href="https://twitter.com/OnePlus_Support">@OnePlus_Support</a> until I ruled out the OS and mentioned the words &quot;warranty repair.&quot;</p>&mdash; Alex Moundalexis (@technmsg) <a href="https://twitter.com/technmsg/status/637338997275148288">August 28, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### #28

**L2 - Arvin (OnePlus)**  
Aug 29, 20:54

> Hi Alex,
>
> Thank you for the update.  
> Your ticket has been forwarded to the appropriate department for further action.  
> Rest assured that this will be attended to with careful attention.  
> Please check your email from time to time for updates.  
> One more thing, please provide us the current os of your phone as well as the build number.  
> It's under settings then about.  
> Thank you so much and please take care.  
>
> Arvin

Isn't that all in the case history?

### #29

**Alex**  
Aug 29, 21:50

> Android version 5.0.2
>
> OxygenOS version 1.0.2
>
> Build number A001\_12\_150813

### #30

**Joseph (OnePlus)**  
Aug 30, 05:54

> Hi Alex,
>
> Good day to you!
>
> Thanks for getting in touch with us. I'm sorry for any inconvenience caused. The situation of your device is qualified for a replacement. Before initiating the RMA process, will need to check the physical condition of your device. Do you recall has you device ever been dropped into, or exposed to liquid? If so, please describe it as detailed as possible. This will expedite the further diagnose process. Thanks.
>
> Thank you for your cooperation.
>
> Best regards,
>
> Joseph

### #31

**Alex**  
Aug 30, 09:16

> The device has never been exposed to liquid of any kind.
>
> The device has only been out of the original box for 4-5 days.
>
> Sent from a mobile device; please excuse brevity.

### #32

**jan ice (OnePlus)**  
Aug 30, 23:03

> Hi Alex,
>
> Sorry if any inconvenience caused. Based on the feedback by our tech support, this case is qualified for a replacement.
>
> We have created an RMA request for you. Please go to [http://oneplus.net/awrma/customer_rma/list](http://oneplus.net/awrma/customer_rma/list) to verify your request details, pickup address and shipping address, so as to initiate this replacement RMA procedure. Once it's verified, we will proceed with the pick-up arrangement.
>
> NOTICE: All returned products are subject to inspection upon arrival. Should any user damage found (for example, dropping damage, water damage, etc.), we reserve the right to have it resolved via either of those two approaches upon customer's confirmation: 1). Customer will pay for the corresponding repair fee to get a replacement; or 2). Customer will pay for the two-way shipping costs to get back the damaged device.
>
> Replacement RMA Procedure: RMA Verification > Pickup > Return Inspection > Ship Replacement (within 7 days of return) > Complete
>
> Thank you for your understanding and cooperation.
>
> Best regards,
>
> jan ice

I went to the web site and verified my shipping address. The "RMA status" changed from "Pending Verification" to "Verified" although there weren't any other indications of what was supposed to be happening. Based on email #32, I'm guessing that I'll be contacted with Pickup instructions?

### #33

**Joseph (OnePlus)**  
Aug 31, 23:35

> Hi Alex,
>
> We're pleased to inform you that your RMA was verified and we are going to arrange the pick-up accordingly. The device(s) will be collected by our partner, GPSK Ltd. (UK) via DHL.
>
> Instructions:
> 
> 1. Please back up all your data first;
> 2. Remove all add-ons from the device, such as any SIM cards, StyleSwap covers, screen protectors, etc.;
> 3. Login OnePlus.net to print the RMA documents, put them and the device(s) in the package. DO NOT include any accessory, charger, cable or SIM ejector tool in the package;
> 4. The return package is already insured and won’t require extra insurance;
> 5. Please use original OnePlus box or use a box of similar size (20cm x 20cm x 5cm depth) with cushion and make sure all the items are properly packaged for shipping. Do not post in overly large or heavy box. Failure to do so will void transit insurance;
> 6. Please do not send any package to our Hong Kong warehouse;
> 7. All returned products are subject to inspection upon arrival. Should any user damage found (for example, drop damage, water damage, etc.), we reserve the right to have it resolved via either of those two approaches upon customer's confirmation: 1). Customer will pay for the corresponding repair fee to get a replacement; or 2). Customer will pay for the two-way shipping costs to get back the damaged device.
>
> Procedure with GPSK:
> 1. Click https://www.express-logistics-platform.dhl.com/rlp/ , login with below account info. to create a booking:  
> Login: shipping@gpsk.com  
> Password: XXXXXXXXX (Please note the capital X in password);
>
> 1. Fill in the pink fields of the booking form at: Collect > Shipper Information (please provide your valid email address at "Email #1") & Shipping Services > Collection Date; then tick the box "Send paper work to shipper";
> 2. Go to "Declarable items" > "Customs documents upload", then upload the Invoice we provided as attached, after converting it to PDF format (Note.: only PDF file can be recognized);
> 3. Once your booking is verified, a pre-paid shipping label will be sent to you via email (contact us if you don't receive it in 3 days); Print the label;
> 4. The courier will come to collect the package as booked. Make sure you are available during that time and get the shipping reference once handed over the package.
> 5. Once collected, the item will be back with our service center (GPSK Ltd.) within 1-3 working days - please wait for our confirmation.
> 6. Should you miss the pick-up, you can simply re-create the booking.
>
> RMA Procedure: RMA Verification > Pick-up > Return Inspection > (Pay Repair Cost) > Ship Replacement / Repaired (within 7 days of return/ payment)> Complete
>
> Thank you for your cooperation. Let me know if you have any question.
>
> Best regards,
>
> Joseph
> 
> Attachment(s)  
> Invoice11.xls

Sending login details in an email. :-/

I packaged things up in an Amazon A3 box, well padded. Hopefully that's not "overly large."

When I went to create the appointment with DHL, the option to specify list Declarable Items wasn't even an option; I can only hope that these were generalized instructions and perhaps the form isn't required for US-to-UK shipments. I've filled it out anyways and will keep it when the courier arrives. The closest appointment was two days away, some time between 9 and 5.

DHL emails me the shipping label, on which is labeled "if you're using your own packaging, don't seal it, it needs to be inspected and sealed by the courier." Oops.

Pickup goes without a hitch. I receive a tracking number and the name and phone number of the local DHL driver.

### #34

**Alex**  
Sep 3, 23:36

> DHL picked up the parcel, tracking WAYBILL XX XXXX XXXX

### #35

**May (OnePlus)**  
Sep 5, 17:19

> Hi Alex,
>
> Thank you for the tracking information. So far we still haven't got confirmation from warehouse. We will keep you updated once the returned package is confirmed received.
>
> Thank you for your understanding and patience.
>
> Best regards,  
> May
 
It took a few days for DHL to get the package from Baltimore to it's final destination in the United Kingdom.

### #36

**Alex** 
Sep 8, 09:12

> Looks like it's been delivered.

### #37

**Michael Liu (OnePlus)**  
Sep 8, 15:57

> Hi Alex,
>
> Thank you for inquiry.
>
> Normally it takes 1-2 days for the inspection and verification, before the RMA being released to be continued. If there is any update, we will keep you posted.
>
> Hope for your patience and understanding.
>
> Best regards,  
> Michael Liu

It took another couple days for the package to be processed.

### #38

**Frida (OnePlus)**  
Sep 12, 12:25

> Hi Alex,
> 
> We've received the parcel at our warehouse and will further proceed your RMA request.
>
> Best regards,  
> Frida

### #39

**Ned (OnePlus)**  
Sep 13, 04:50

> Hello Alex ,
>
> Good day!
>
> We are very sorry for the late response. Thank you for your prompt response and professional attention. We really appreciate it. We are about to proceed with creating an order. Please confirm if the address below is your correct shipping address. This is to make sure that the parcel will reach the intended person.
>
> Alex Moundalexis  
> [address removed]  
> T:XXXX-XXX-XXXX
>
> If the information above is not your RMA address, please feel free to supply the required information below:
> 
> First Name *  
> Last Name *  
> Company  
> Street Address *  
> City *  
> Country *  
> State/Province *  
> Zip/Postal Code *  
> Telephone *  
>
> Once we received this confirmation, we will proceed immediately with your request.
>
> Thank you so much for your patience and understanding all this time. Hope everything will work out for you!
> 
> Sincerely,
> 
> Ned

Didn't I confirm my address two weeks ago? Does the RMA department not have access to the records I already updated?

### #40

**Alex**  
Sep 13, 04:52

> Looks good.

### #41

**OnePlus: New Order # AXXX**  
Sep 14, 12:43

> Hello, Alex Moundalexis
>
> Thank you for your order!
>
> You will receive a tracking number by email once your package ships. Orders are normally processed within 5-10 business days. You can check the status of your order by logging in at https://oneplus.net/customer/account. Answers to commonly-asked questions can be found here: https://oneplus.net/support.
>
> Find your order confirmation below. Thank you again for ordering from OnePlus.
>
> Your Order #AXXX (placed on September 14, 2015 5:43:13 PM BST)

Grand Total: $0.00

So far so good.


### #42
	
**OnePlus: Invoice # XXXXXX for Order # AXXX**  
Sep 14, 12:44

> Hello, Alex Moundalexis
>
> Thank you for your order from OnePlus. It will take up to 4 business days for processing. Then, once your order has shipped, you will receive an email with a link to track your order.
>
> You can check the status of your order by logging into your account. If you have any questions about your order please contact us through https://oneplus.net/support.
>
> Your Invoice #XXXXXX for Order #AXXX

Total is still $0.00. Good.



### #43

**jan ice (OnePlus)**  
Sep 15, 00:45

> Hi Alex,
>
> Good day!
>
> Thank you for your reply. We are sorry for the waiting and any inconvenience caused.
>
> Your returned item(s) are received and have passed the inspection. Now we are going to release the replacement order to be processed. You will be notified via email with tracking number info. once it's shipped.
>
> Let us know if there is anything else we can help you with. Thank you!
>
> Best regards,
>
> jan ice

### #44

**Zendesk**  
Sep 19, 20:03

> This is an automated email from the OnePlus Support Team regarding ticket XXXXXX
>
> Hi Alex,
>
> Just wondering if you've had a chance to review the latest update from ? provided an update some time ago, but we haven't heard back from you.
>
> The ticket is now marked as 'solved'. However, if you'd like to provide an update, or require more time to work through our latest comment, simply reply to this email to reopen the ticket.
>
> If your inquiry was resolved, this ticket will be closed in 5 days.
>
> Thanks! Have a great day!
>
> OnePlus Support

Hmm, "the latest update from ?" looks like a mail merge error or problem with Zendesk templating, maybe the RMA folks *aren't* actually hooked into the support system.

Repeat ire at self-closing cases.

### #45

**Alex**  
Sep 19, 20:07

> I'm awaiting a tracking number for my RMA.

### #46

**Yosef (OnePlus)**  
Sep 21, 01:14

> Hello Alex,
>
> Good day!
>
> Thank you for getting in touch. Here is the tracking number of your parcel: XXXXXXXXXXXXXXXXXXXXXX. You can check on USPS website from time to time, so you will be updated on the status of your parcel.
>
> Hope you have a great day!
>
> Regards,
>
> Yosef

So there *is* a tracking number. Turns out it was created shortly after my last interaction with jan ice and mailed Priority Mail 2-Day from California.

Not that it mattered much, my mail carrier had attempted to deliver it already. I wasn't home and the notice had fallen into the air gap between front door and storm door.

A signature was required, so I had to go to the local post office to collect the package.

### #47

**Alex**  
Sep 21, 13:31

> Package received, camera works, hopefully it'll continue to do so this time. Thanks!

The thing didn't appear to be well-wrapped, [OEM packaging](https://www.flickr.com/photos/techmsg/21591031892/in/album-72157657793043989/) packed within a [thin cardboard box](https://www.flickr.com/photos/techmsg/21415420759/in/album-72157657793043989/) stuffed into a standard [bubble wrap envelope](https://www.flickr.com/photos/techmsg/21415400869/in/album-72157657793043989/). Certainly less cushioning than I sent old one out with, although this *may* be how the original was delivered.

The new OPO booted into CyanogenMod (not OxygenOS) and then almost immediately was upgraded to CyanogenOS 11.1. The camera worked. I upgraded to CM 12.1. The camera works. Hopefully it will continue to do so.

### #48

**Yehoshua (OnePlus)**  
Sep 22, 04:39

> Hello Alex,
>
> A pleasant day to you!
>
> Thank you for getting back to us and informing us that you have received the package. We're glad everything seems to be in order now. We're sorry for the delay though, we don't have full control over our couriers and the unforeseen events that delayed the shipment. Anyhow, I'll be submitting this ticket as "Solved". If you have any more concerns regarding OnePlus, you may open a new ticket anytime.
>
> Thank you for supporting OnePlus. We appreciate your business. Have a great day!
>
> Best regards,  
> Yehoshua

AFACT the shipment wasn't delayed, just the communication of the tracking number.

To be continued? Hopefully not...