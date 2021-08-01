<!-- title: Callcentric on Cisco 7940 -->
<!-- categories: howto -->
<!-- tags: cisco,pbx,callcentric -->
<!-- published: 2021-07-11T09:30:00-05:00 -->
<!-- updated: 2021-08-01T11:30:00-05:00 -->
<!-- summary: Configuring a Cisco 7940 IP Phone to use Callcentric without an intermediate PBX. -->

# Callcentric on Cisco 7940

ℹ️ As an Amazon Associate I earn from qualifying purchases. ([details](/v2/affiliates.html))

Callcentric [supports many different devices](https://www.callcentric.com/support/) but the Cisco 7940 IP phone is not one of them.

The Cisco 7940 was an early contender in the enterprise market for use with Cisco CallManager and never intended for home use, however once [converted to be a SIP phone](https://www.cisco.com/c/en/us/support/docs/collaboration-endpoints/unified-ip-phone-7900-series/5455-handset-to-sip.html) these devices continue to be workhorses long past their [end-of-life](https://www.cisco.com/c/en/us/products/collateral/collaboration-endpoints/unified-ip-phone-7900-series/end_of_life_notice_c51-574072.html) and [retirement](https://www.cisco.com/c/en/us/obsolete/collaboration-endpoints/cisco-unified-ip-phone-7940g.html) dates.

By adapting the [generic SIP configuration](https://www.callcentric.com/support/device/other), the Cisco 7940 can be configured to register with Callcentric directly without an intermediate PBX. 

These instructions assume you’ll be placing configuration files on a TFTP server for the phone to pick up during initialization. There will be many other parameters defined in your configuration files, these are just the ones specific to Callcentric.

Phone-specific configuration:

<pre>
# SIP Configuration Generic File - SIP&lt;MAC&gt;.cnf
# Platform : Cisco Systems, Inc. IP Phone CP-7940G

# Line 2 extension user ID
line2_name: "1777MYCCID" ; or 1777MYCCIDEXT

# Line 2 Registration Authentication
line2_authname: "1777MYCCID" ; or 1777MYCCIDEXT

# Line 2 Registration Password
line2_password: "*******"

# Line 2 Display Name (Display name to use for SIP messaging)
line2_displayname: "ACME Reception"

# Line 2 Short Name (Labels a line key with a name other than the directory number)
line2_shortname: "Callcentric"
</pre>

Default (all phone) configuration:

<pre>
# SIP Default Configuration File - SIPDefault.cnf

# Proxies
proxy2_address: "callcentric.com" ; Can be dotted IP or FQDN
proxy_register: 1

# NAT/Firewall Traversal (if needed for your install, not likely specific to Callcentric)
nat_enable: 1; 0-Disabled (default), 1-Enabled
nat_address: "WAN_ADDRESS"; WAN address of NAT box (dotted IP or DNS A record only)
nat_received_processing: 1; 0-Disabled (default), 1-Enabled
</pre>

And that’s it!

## Tips

Unless you’ve configured a dial-plan, setting a backup proxy (`proxy_backup`) or emergency proxy (`proxy_emergency`) is not recommended as these can prevent the handset from connecting to the line-specific proxies.

To debug SIP registration issues: telnet to the phone, enable debug of SIP messaging, show current registration state, force a registration (of line 2 in this example), and then disable debugging.

<pre>
$ telnet phoneIP
SIP Phone> debug sip-messages
SIP Phone> show register
SIP Phone> register 1 2
SIP Phone> undebug sip-messages
</pre>

SIP state and SIP registration state can also be debugged using the following flags:

<pre>
SIP Phone> debug sip-state sip-reg-state
</pre>

A word about the order of configuration processes, according to Cisco:

> Parameters in the default configuration file override those stored in the phone's flash memory. Parameters in the phone-specific configuration file override those stored in the default configuration file. When a phone is rebooted, the manually set values of parameters are overridden by the values found in the configuration files (if the same parameters exist in at least one of the configuration files).

Hope this helps!

🆕 **Update 08/01/21**: After making these changes I've noticed the lower softkeys (i.e. New Call, Forward, etc) disappear from the main screen after a day or two. The handset still functions properly otherwise, inbound and outbound calls still complete, and the softkeys always return after a reboot. The only changed values were `nat_enable`, `nat_address`, `nat_received_processing`, and the specification of a named SIP provider instead of an IP address; my theory is that some combination of additional DNS lookups or NAT processing are exposing some sort of bug. Given that the 7940 is EOL I've reverted to using an intermediate PBX without NAT. I've also been experimenting with a [Grandstream GX1625](https://amzn.to/3xkX9oW) as a replacement; the build quality isn't anywhere near the Cisco handset but acceptable given the cost, but it's a supported platform and has per-account NAT settings.

## References

Cisco SIP IP Administrator Guide, Version 8.0 (updated 2/14/2014)

* Chapter: [Initializing Cisco SIP IP Phones](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cuipph/7960g_7940g/sip/8_0/english/administration/guide/8_0/sipins80.html)
* Chapter: [Managing Cisco SIP IP Phones](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cuipph/7960g_7940g/sip/8_0/english/administration/guide/8_0/sipmn80.html)
* Chapter: [Monitoring Cisco SIP IP Phones](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cuipph/7960g_7940g/sip/8_0/english/administration/guide/8_0/siptrb80.html)
* Chapter: [Configurable Parameters for the SIP IP Phone](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cuipph/7960g_7940g/sip/8_0/english/administration/guide/8_0/sipaxd80.html)

FreePBX Community: [Cisco 7940G](https://community.freepbx.org/t/cisco-7940g/24399)

VOIPo: [Cisco 7940 Help](https://www.voipo.com/forums/showthread.php/1875-Cisco-7940-Help)

Cisco Product Support: [Converting a Cisco 7940/7960 CallManager Phone to a SIP Phone and the Reverse Process](https://www.cisco.com/c/en/us/support/docs/collaboration-endpoints/unified-ip-phone-7900-series/5455-handset-to-sip.html) (updated 9/19/2014)

Cisco: [End-of-Life Milestones and Dates for the Cisco Unified IP Phones 7940G and 7960G](https://www.cisco.com/c/en/us/products/collateral/collaboration-endpoints/unified-ip-phone-7900-series/end_of_life_notice_c51-574072.html) (updated 1/22/2010)

Cisco: [Cisco Unified IP Phone 7940G - Retirement Notification](https://www.cisco.com/c/en/us/obsolete/collaboration-endpoints/cisco-unified-ip-phone-7940g.html)
