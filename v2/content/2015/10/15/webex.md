<!-- title: How to Be Awesome at WebEx -->
<!-- categories: howto -->
<!-- tags: talks,speaking,presentations -->
<!-- published: 2015-10-09T21:19:00-05:00 -->
<!-- updated: 2015-10-16T15:15:00-05:00 -->
<!-- summary: Teleconferencing is hard. If you haven't experienced some of these things, join more calls. -->

# How to Be Awesome at WebEx

There are an astounding number of people for whom teleconferencing is hard. It's an ironically comic yet depressing theme in Silicon Valley, the bastion of high tech gadgetry and software services, that teleconferencing remains a problem of [NP](https://en.wikipedia.org/wiki/NP_(complexity) proportions.

As comedian Chris Rock might have said if No Sex were about presence,

> Some of things I've said may not apply to you. Some of the things I've said may offend you. But no matter who you are, you must remember this one thing. There's no joy on a WebEx call.

I'm a big fan of Google Hangouts for smaller meetings, up to a dozen or so people. It's more of a hog on CPU than network bandwidth, but it's free, integrated with Google App contacts, and includes most of the features offered by WebEx.

But for those stuck with WebEx, a few tips...

## Be Punctual

By punctual, I mean early. If you're on time, you're late. Especially if you're the host. And if you are presenting, you need time to ensure you can share your screen successfully. The time to try that is before the meeting begins.

If you are using your own personal WebEx room to host, no one can enter the room until you do. If you are merely on time, then the first few minutes are occupied with the backlog of other attendees entering the room.

The fact that most hosts will wait for late-comers further reinforces two points:

* that it's okay to be late
* that it's okay to waste the time of the punctual

I start my meetings on time. If you're not there, too bad. If you're late to your own meeting without forewarning, I leave.

## Join the WebEx

If you're hosting a WebEx for remote employees, make sure you actually join.

## Use the WebEx Web App

Though sometimes clunky, there are perks to using the WebEx web app: reducing costs and increased efficiency.

### Reducing Costs

WebEx services are typically billed by usage, per-minute. The billing rate varies depending on your connection method (and also per your contract with WebEx, bulk discounts and the like), but consider the following ballpark examples:

* Web $0.02/minute
* Phone $0.04/minute
* Toll-Free $0.06/minute

Most business phone lines are also billed by usage, per minute. So in addition to paying to use WebEx's inbound phone line, you're paying for your business's outbound phone line too.

By comparison, most home and business Internet connectivity in the United States is billed monthly with capped throughput (i.e. $50/month for 15 MB/s download), not metered by usage like mobile plans (i.e. $10/month per gigabyte).

For example, if 100 participants dialed into an hour-long meeting via a toll-free WebEx line from their cell phones.

    $0.06/minute * 60 minutes * 100 attendees = $360

And that assumes that the outbound calls didn't cost anything. The costs are small compared to the value of the attendee's time, but they add up. If you're already at your desk or Internet-connected laptop, using the web app can save a large fraction of the cost. Why spend for the sake of spending?

    $0.02/minute * 60 minutes * 100 attendees = $120, a savings of 67%

How many of those day-long WebEx sessions have *you* dialed into?

Don't forget to disconnect, though. How many times have you found a WebEx session running where you were the last attendee and you've just been idling there in an empty room?

### Efficiency

When you login to the app, you can see the other people in the meeting in the Participants window. As the host of a meeting, you don't need to interrupt the meeting whenever you hear an entry tone to ask "who just joined?"

You can also mute noisy callers. A list of "currently talking" callers appears at the top of the web app screen. To mute, find them in the Participant list and click the microphone icon next to their name. Callers muted via WebEx will have a red microphone icon.

You can rename attendees who have dialed in so that other people can see who they are, or at least who you think they are, e.g. NoisyCaller, DrivingUnderwaterThroughATunnel. Right-click the call-in user's assigned name and select Rename, enter the participant's name, then select Enter.

There's a chat room. Helpful for attendees who can't speak for whatever reason, need to relay technical jargon, or when Mute on Entry (see below) is enabled.

You can share your screen with other attendees. That is why we have WebEx to begin with, right?

## Share the Host Code

For internal meetings, it's a good idea to include the host code in the meeting invitation. That way if you do have to dial in, someone else can reclaim the host role in order to mute people.

Participant > Reclaim Host Role (enter code)

## Mute on Entry

For large one-way conference calls, where there's only a few speakers and a lot of attendees, mute all lines on entry. The host can unmute a select few as needed.

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Just told someone about <a href="https://twitter.com/WebEx">@WebEx</a> about mute-on-enter (in Participant drop-down). Karma-wise, that&#39;s got to be huge.</p>&mdash; Alex Moundalexis (@technmsg) <a href="https://twitter.com/technmsg/status/502505347802603521">August 21, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Participant > Mute on Entry

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/techmsg/21572595524/in/dateposted/" title="WebEx Participant Menu"><img src="https://farm6.staticflickr.com/5829/21572595524_3b79e2eb0d.jpg" width="373" height="323" alt="WebEx Participant Menu"></a>

Additionally, dialed-in meeting hosts can:

* mute all attendees by dialing ##
* unmute all attendees by dialing 99

In the web app:

* Participant > Mute All
* Participant > Unmute All 

## Readable Meeting IDs

Of the following two identical meeting numbers, which is easier to read?

* 64791220
* 647 912 20

Any more than three consecutive digits is hard me to remember, even for a short period of time. There are studies about this [phenomenon](https://en.wikipedia.org/wiki/Chunking_%28psychology%29).

## Differing Capabilities

I see many meeting invitations with the following notation.

> Location: 8005551234,,,12345678#,,,#

The commas harken back to the days of [Hayes-compatible modems](https://en.wikipedia.org/wiki/Hayes_command_set#The_basic_Hayes_command_set) where a comma would insert a two second pause. Some modern phones obey that behavior and I like to believe that the organizer is attempting to save callers time by having them join the conference with one key press.

The thing is, it doesn't work across the board.

* For Android users, [w/p syntax](http://www.androidpolice.com/2010/05/10/how-to-add-hard-wait-and-soft-2-3-sec-pauses-to-your-android-contacts/) is supported, but [commas are stripped and can result in network errors](https://code.google.com/p/android/issues/detail?id=183973&q=comma&colspec=ID%20Type%20Status%20Owner%20Summary%20Stars)
* For CyanogenOS users, the comma syntax appears to work
* For iPhone users, [,/; syntax](https://support.apple.com/en-us/HT202176) is supported
* For Google Voice and Hangouts users, [it doesn't appear to be supported](https://plus.google.com/+KeithBarrett/posts/S5rzn8d7fru)
* For those Skype, [pause characters are stripped](http://community.skype.com/t5/Other-features/DTMF-and-pause-characters/td-p/3652979)
* For those with home/business phones, it does nothing

Adding pauses and login details can be useful for some ([less than 50% of mobile users](http://www.forbes.com/sites/dougolenick/2015/05/27/apple-ios-and-google-android-smartphone-market-share-flattening-idc/)), but it's really hard to read for everyone else. See above.

## Disable Entry and Exit Tone

Entry and exit tones are obnoxious. They're more obnoxious on calls with more than a half-dozen attendees. They're even more annoying when attendees aren't punctual, providing an audible source of (and cause for) interruption. Outside presenters unfamiliar with the tones are often flummoxed by them.

Participant > Entry and Exit Tone (see image above)

There doesn't appear to be a command to do this as a dialed-in host.

The *only* cool part is listening to all the exit tones after a large meeting. It can be quite impressive. A friend of mine and I will attempt to guess whether we're the last two on the call, waiting each other out, where the first to speak is the loser. I'd gladly give up this game if it meant never hearing the tones again.

## Repeat ALL Questions

When taking questions from attendees, repeat the questions.

Those dialed in won't be able to see the question if it came from the WebEx chat.

Questions from shared office or conference room phones are typically hard to hear, muffled, or echoey.  Callers in noisy or distracting environments may not have heard them. It's beneficial to all attendees to repeat the question is a strong clear voice.

## Mute your phone

If you're riding in a car or on public transit, mute.

If you're in a public place with ambient noise, mute.

If you're at home and the kids are screaming, mute.

If you're driving, mute. Better yet, don't dial in.

If you're using a speaker phone of any kind, mute.

If you're in another meeting, mute.

If you're in the bathroom, mute.

If you aren't talking, mute.

Or if that's not subtle enough...

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Iyamba&#39;s Law of Teleconferencing: Mute Your Shit</p>&mdash; Laura G. (@MsYuppieScum) <a href="https://twitter.com/MsYuppieScum/status/542399048188055553">December 9, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Back when most telephones were attached to a cord, the handset was shaped in such a way that kept the earpiece a sufficient distance from the receiver to effectively prevent feedback loops. Speaker phones by design are more prone to feedback, although more advanced models tend to keep the microphones well away from the speakers.

Mobile phones don't have the luxury of distance between microphone and speaker, although with some of the phablets we're getting there. The problem seems to be exasperated when using the speaker phone mode on a mobile phone or in an area with lots of ambient noise.

The manufacturers and developers of mobile devices attempt to fix it with a variety of noise-reduction and echo-eliminating software, with mixed results. The same goes for speaker phone manufacturers, developers of telephony software, and conference call providers, who are often one in the same.

The only way to consistently prevent feedback is to reduce the amount of input signal coming into the meeting bridge, which means muting your line.

### How to Mute

Muting is so important that there are *numerous* ways to do it no matter how you've joined the WebEx meeting.

On your phone:

* ALL: dial \*6 to mute, then \*6 to unmute
* Android: select the icon of a microphone with a slash through it
* iPhone: select the icon of a microphone with a slash through it

On Mac OS X

* Participant > Mute (see image above)
* Shift-Command-M
* click the mic icon to the right of your name

On Windows

* click the mic icon to the right of your name
* click the "Mute Me" icon in the menu

On Google Hangouts

* select the icon of a microphone with a slash through it
* on a Mac, Command-D is the keyboard shortcut for this
* on a PC, Ctrl-D is the keyboard shortcut for this

Of course, none of these solutions fixes the following...

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Moundalexis Theorem of Teleconferencing: The person who thinks they need to interject is the most likely to have a noisy unmuted phone.</p>&mdash; Alex Moundalexis (@technmsg) <a href="https://twitter.com/technmsg/status/529672751368646657">November 4, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

## Remember the Chat Window

In a meeting with many attendees talking over the phone or through microphones on their computers, it is easy to forget the other attendees in noisy environments who, out of consideration of others, feel they cannot unmute to also speak. They will post questions and feedback in chat instead. Do not forget to look for those messages and respond to them.

It is dispiriting for a host to ask around for questions from those who can speak, but then ignore those who can't.

In a large meeting, a facilitator should monitor chat to help offload the host and presenter duties.

## Time Zones

A huge benefit of WebEx is that it lets geographically dispersed groups meet. This presents some challenges which you should keep in mind as a host.

* Find meeting times that are not unreasonably early or late for some attendees. A 9 AM meeting on the east coast of the US is a 6 AM meeting on the west coast, and a 5 PM meeting on the west coast is an 8 PM meeting on the east coast.
* Avoid scheduling meetings during lunch hour in any time zone, if possible. Otherwise, let those affected eat during the meeting.

## Recording

I don't always record my WebEx sessions, but when I do...

I familiarize myself with the [recording process](https://support.webex.com/support/documentation/help/index.htm#12333.htm) *before* the call.

I inform all participants that I'm planning to record the session *in advance* and then announce that I'm about to begin recording. In my state, it's illegal to record a conversation without the consent of all parties. The [recording laws in your state](https://www.rcfp.org/reporters-recording-guide/state-state-guide) may vary, but it's never a bad idea to give participants the opportunity to opt out.

I actually start recording. You'd be amazed how many people forget this step.

In the event that I forget to start recording, I either:

* restart the presentation after starting the recording
* commit to re-record the presentation later

Partially recorded presentations are far less helpful, especially when the beginning is cut off. The same goes for situations where the presenter is muted for the first 10-15 minutes but doesn't realize it.

## Closing Notes

In my three years as a remote employee I've been given ample opportunity to complain about the state of teleconferencing. It's easy to pick on WebEx and [many](https://twitter.com/j_houg/status/536967588463390720) [certainly](https://twitter.com/josh_elser/status/611613594426437632) [do](https://twitter.com/tensigma/status/593421165353431041), but most of the problems with teleconferences are far more general. And it'll likely continue to be a frustrating thing.

Suggestions and additions appreciated, particularly for different versions of WebEx software.
