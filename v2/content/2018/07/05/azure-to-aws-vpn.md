<!-- title: Azure to AWS VPN Tunnels -->
<!-- categories: howto -->
<!-- tags: azure,aws,vpn,tunnel,ike,ipsec -->
<!-- published: 2018-07-05T17:00:00-05:00 -->
<!-- updated: 2020-08-09T17:30:00-05:00 -->
<!-- summary: Notes from creating a VPN tunnel from Azure to AWS using VyOS. -->

# Azure to AWS VPN Tunnels

In the course of a hackathon project we needed to configure a VPN tunnel between AWS and Azure. In production we'd use [Direct Connect](https://aws.amazon.com/directconnect/) and [ExpressRoute](https://azure.microsoft.com/en-us/services/expressroute/) but we were short on time. Both cloud providers have managed VPN offerings which are fairly simple to set up and don't cost too much.

After configuring the two managed VPN services, permitting relevant IPSec/ISAKMP traffic to pass on each provider's respective network, and setting the proper routes on both sides, the tunnels weren't coming up.

Troubleshooting continued -- as it often does -- into the night...

## "Why can't this just work?"

The [Internet Key Exchange](https://tools.ietf.org/html/rfc2409) (IKE) protocol has been around since 1998. Its "purpose is to negotiate, and provide authenticated keying material for, security associations in a protected manner." Super useful protocol for establishing trusted links between two parties. 

[Internet Key Exchange Protocol Version 2](https://tools.ietf.org/html/rfc4306) (IKEv2) has been around since 2005.

In short, Azure and AWS don't support the same versions of IKE.

* AWS doesn't support IKEv2 in their [Managed VPN Connections](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html), only IKEv1.
* Azure supports IKEv2 on [route-based VPNs](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-connect-multiple-policybased-rm-ps); they support IKEv1 too, but only on policy-based VPNs and at the time of writing their throughput was significantly less (< 100 Mbps) than we needed.

Feature requests have been filed with both providers for a LONG time (read: years).

Note: [Google Cloud VPN](https://cloud.google.com/network-connectivity/docs/vpn/concepts/overview) supports both IKEv1 and IKEv2.

We wanted to use IKEv2, so that meant changing something on the AWS side. Amazon's solution -- other than peering -- is running a third party software VPN on an EC2 instance. So that's what we did.


## VyOS Configuration

[VyOS](https://www.vyos.io/) is pretty slick, an open source network OS that provides a variety of network applications: VLANS, static and dynamic routing, firewall, tunnels, VPN, NAT, DHCP, VRRP, flow accounting, proxy, and shaping.

There's no GUI or remote management, all setup is done from the command line. If you've ever configured a router or switch running Cisco IOS you'll feel right at home.

We deployed a VyOS image from [AWS Marketplace](https://aws.amazon.com/marketplace/pp/B074KJK4WC?qid=1530227509484&sr=0-1&ref_=srh_res_product_title) (since replaced with [a newer and more expensive version](https://aws.amazon.com/marketplace/pp/B07N3X1P1T?qid=1596988076570&sr=0-1&ref_=srh_res_product_title)) onto an m4.2xlarge instance.

First thing, Joseph from [My Coding Pains](https://www.mycodingpains.com/) has a **beautiful** step-by-step implementation guide on [how to establish a Route Based VPN with Azure VPN](https://www.mycodingpains.com/establish-route-based-vpn-azure-vpn-no-bgp/) that provided *exactly* what we needed, complete with screenshots and example configuration. So we used it. You should too.

There were two things that we had to do first when configuring VyOS:

1. Add another user's public key so that multiple people could administer VyOS via SSH without using a shared key.

        #
        set system login user vyos authentication public-keys rick type ssh-rsa
        set system login user vyos authentication public-keys rick key "ABCthewholepublickeyABCX"

2. Specify the interface to use for IPSec -- without it, committing the IPSec configuration will fail.

        #
        set vpn ipsec ipsec-interfaces interface eth0

After that, the commands below mirror those provided by Joseph, substituting our network addresses.

The two subnets:

* 10.1.0.0/24 - AWS
* 10.2.0.0/24 - Azure

The relevant IP addresses:

* 10.1.0.212 - private IP of the VyOS instance
* 203.0.113.5 - public IP of the Azure VPN endpoint


<pre><code>#
set vpn ipsec ike-group IKE2-AES256-SHA1-LT28800 lifetime 28800
set vpn ipsec ike-group IKE2-AES256-SHA1-LT28800 proposal 1 dh-group 2
set vpn ipsec ike-group IKE2-AES256-SHA1-LT28800 proposal 1 encryption aes256
set vpn ipsec ike-group IKE2-AES256-SHA1-LT28800 proposal 1 hash sha1
set vpn ipsec ike-group IKE2-AES256-SHA1-LT28800 ikev2-reauth 'no'
set vpn ipsec ike-group IKE2-AES256-SHA1-LT28800 key-exchange 'ikev2'
set vpn ipsec ike-group IKE2-AES256-SHA1-LT28800 dead-peer-detection action restart
set vpn ipsec ike-group IKE2-AES256-SHA1-LT28800 dead-peer-detection interval 15
set vpn ipsec ike-group IKE2-AES256-SHA1-LT28800 dead-peer-detection timeout 30

set vpn ipsec esp-group ESP2-AES256-SHA1-LT27000 lifetime 27000
set vpn ipsec esp-group ESP2-AES256-SHA1-LT27000 mode tunnel
set vpn ipsec esp-group ESP2-AES256-SHA1-LT27000 pfs dh-group2
set vpn ipsec esp-group ESP2-AES256-SHA1-LT27000 proposal 1 encryption aes256
set vpn ipsec esp-group ESP2-AES256-SHA1-LT27000 proposal 1 hash sha1

edit vpn ipsec site-to-site peer 203.0.113.5
set description "Azure non BGP route based connection"
set authentication mode pre-shared-secret
set authentication pre-shared-secret '12345'
set connection-type initiate
set ike-group IKE2-AES256-SHA1-LT28800
set default-esp-group ESP2-AES256-SHA1-LT27000
set tunnel 1 local prefix 10.1.0.0/24
set tunnel 1 remote prefix 10.2.0.0/24
set local-address 10.1.0.212
top
commit
</code></pre>

One last departure from Joseph's guidance: when it comes to network devices, I don't save the running configuration until I'm sure that things are working properly. Especially when making changes to remote management authorization. If you get locked out, it's easy to reboot the instance.
 
VyOS supports [rollback](https://wiki.vyos.net/wiki/Rollback_\(command\)), but it triggers a reboot anyways, so the net result would be the same.

Once we saw the tunnels up and passing traffic, we saved.

    #
    save

Warning: [MTU woes in IPSec tunnels](https://www.zeitgeist.se/2013/11/26/mtu-woes-in-ipsec-tunnels-how-to-fix/) aren't uncommon. We saw an example of this where SSH connections would hang indefinitely during session setup. We could have tweaked the network to fix, but for the short duration of the hackathon we were able to [specify the key exchange algorithm](https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/1254085/comments/39) to workaround.

