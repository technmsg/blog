<!-- title: Locking Down an SSH Server -->
<!-- categories: howto -->
<!-- tags: ssh,sshd,linux,fail2ban,denyhosts,openssh -->
<!-- published: 2016-09-06T14:00:00-05:00 -->
<!-- updated: 2016-09-06T14:00:00-05:00 -->
<!-- summary: If your host is connected to the Internet, it's likely under attack. Not theoretically... right now. Short of disallowing remote access entirely, it's wise to secure your SSH server. -->

# Locking Down an SSH Server

If you have a publicly accessible host connected to the Internet, it's likely under attack. Right now. Between botnets, zombies, and the odd security researcher, the vast majority of remote login attempts aren't made by legitimate users of your host. It's not uncommon for a host to endure thousands of login attempts per day.

It would be far safer to disallow remote access to our hosts entirely, but then administration becomes a tedious affair.

The default settings for [OpenSSH](http://www.openssh.com/) server are pretty good for use inside the corporate firewall, but for systems exposed to the Internet it's wise to tighten things up a bit further. Having run a publicly accessible host for more than a decade, these are most common settings that I override.

    LoginGraceTime 30
    PermitRootLogin no
    MaxStartups 3:50:10
    AllowUsers alice bob carol david

That's it.

The goals of these four settings are to conserve system resources, protect the superuser account, and mitigate the effect of brute force attacks.

## OpenSSH Server Keywords

Let's examine each of these configuration keywords in more detail.

Note: The official [sshd\_config documentation](http://man.openbsd.org/sshd_config) is thorough, but may include more recent keywords and default parameters than what's installed on your system. Make sure you check the man page for sshd\_config on your particular system before making changes.

### LoginGraceTime

The OpenSSH daemon doesn't disconnect immediately after an unsuccessful login attempt. By default, connections remain open for two minutes. I decrease that grace time down to 30 seconds.

    LoginGraceTime 30

When your host is the target of brute force attacks all day long, there's no reason to keep connections open longer than necessary. The more ephemeral ports held open as a result of port-scanning brute-forcing bots, the fewer ephemeral ports are available for legitimate network traffic.

### PermitRootLogin

There's no good reason to allow interactive remote logins as root. At all. Ever.

    PermitRootLogin no

Some may argue that running remote backups with the `forced-commands-only` parameter can be useful. This parameter allows for root logins, but requires using public key authentication _and_ [pre-configured commands](https://binblog.info/2008/10/20/openssh-going-flexible-with-forced-commands/). If you're using [rsync](https://en.wikipedia.org/wiki/Rsync) to synchronize files from one host to another, doing so as root allows all file ownership information on the source system to be preserved.

The users on my systems are responsible for their own backups, so for me allowing root logins in any capacity isn't worth the risk.

### MaxStartups

`MaxStartups` specifies how many concurrent unauthenticated connections to the SSH daemon are allowed. This can be set up in [one of two ways](https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Load_Balancing#MaxStartups): a simple integer such as 10 after which additional connections will be refused, or it can be set to randomly drop connections after specified thresholds are met.

    MaxStartups 3:50:10

In this case, starting with 3 new connections pending authentication the server will start to drop 50% of the new connections. The probability of random drop increases linearly with the size of the backlog. By the time the backlog increases to 10 pending unauthenticated connections, 100% will be dropped.

This can significantly throttle login attempts, but the parameter needs to be tuned for the use of your particular host. While the theory is that some bots will move on to the next host upon failure, MaxStartups can effectively result in a denial of service to legitimate users. The default in OpenSSH server is now `MaxStartups 10:30:100` but for a hobby server you can usually get away with much more restrictive parameters.

### AllowUsers

As much as we'd like to use `PasswordAuthentication no` to require public key authentication for all users, effectively rendering dictionary or brute force attacks futile, there are times when it just isn't an option. But we can restrict which user accounts are allowed to login.

    AllowUsers alice bob carol david

If a user's username doesn't appear in `AllowUsers`, they can't login via SSH. It doesn't matter if they have a valid account and can login at the console, the OpenSSH daemon will not let them in.

Since I don't allow common usernames, `AllowUsers` effectively stops brute force dictionary attacks. For a small hobby system, this is manageable. For larger systems, consider `AllowGroups` instead.

## Logs

No matter how you configure the SSH daemon, a working knowledge of its logs is essential when sorting out normal behavior from abnormal. Here's a few examples of what the logs might look like after enabling the parameters above.

### Valid User, Not Allowed

Suppose I have a friend named Dean has a valid account on the server named genesis, but he's not not listed in `AllowUsers`. When Dean tries to login remotely, the security log will look like this.

<pre>
Aug 20 03:18:13 genesis sshd[27054]: User dean from wkst21.nyc.example.com not allowed because not listed in AllowUsers
Aug 20 03:18:13 genesis sshd[27055]: input_userauth_request: invalid user dean
Aug 20 03:18:14 genesis sshd[27054]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=wkst21.nyc.example.com  user=dean
Aug 20 03:18:16 genesis sshd[27054]: Failed password for invalid user dean from 203.0.113.25 port 52889 ssh2
Aug 20 03:18:18 genesis last message repeated 2 times
</pre>

After three failures, the SSH daemon severs the client connection. Automated scanners don't always close their connections and so it's possible that the connection will remain open until the `LoginGraceTime` period expires.

### Invalid User

By comparison, Erin does not have an account on the system. When a compromised server attempts to login, the security log looks a little different. Note the error where PAM attempts to retrieve user information.

<pre>
Aug 14 10:01:56 genesis sshd[7044]: Invalid user erin from 70.35.196.91
Aug 14 10:01:56 genesis sshd[7045]: input_userauth_request: invalid user erin
Aug 14 10:01:56 genesis sshd[7044]: pam_unix(sshd:auth): check pass; user unknown
Aug 14 10:01:56 genesis sshd[7044]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=70.35.196.91
Aug 14 10:01:56 genesis sshd[7044]: pam_succeed_if(sshd:auth): error retrieving information about user erin
Aug 14 10:01:58 genesis sshd[7044]: Failed password for invalid user erin from 70.35.196.91 port 9224 ssh2
Aug 14 10:01:58 genesis sshd[7045]: Connection closed by 70.35.196.91
</pre>

In both cases, the SSH daemon will ask the user for their password several times before severing the connection. There's no visible sign to the user (or attacker) whether an account is valid, invalid, valid but not allowed, or whether the password was incorrect, it's just an unsuccessful login.

### Root, Not Allowed

The root user isn't listed in `AllowUsers`, so the security log looks nearly identical to that of a valid user. Even if root *were* listed in `AllowUsers`, the `PermitRootLogin no` would kick in and disallow the login.

<pre>
Aug 14 12:30:24 genesis sshd[30211]: reverse mapping checking getaddrinfo for 82.133.127.124.broad.bj.bj.static.163data.com.cn failed - POSSIBLE BREAK-IN ATTEMPT!
Aug 14 12:30:24 genesis sshd[30211]: User root from 124.127.133.82 not allowed because not listed in AllowUsers
Aug 14 12:30:24 genesis sshd[30212]: input_userauth_request: invalid user root
Aug 14 12:30:24 genesis sshd[30211]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=124.127.133.82  user=root
Aug 14 12:30:26 genesis sshd[30211]: Failed password for invalid user root from 124.127.133.82 port 60977 ssh2
Aug 14 12:30:26 genesis sshd[30212]: Connection closed by 124.127.133.82
</pre>

Note: If `UseDNS` is enabled you'll inevitably see a bunch of "POSSIBLE BREAK-IN ATTEMPT" messages. While it is likely true in this example, the message is misleading: this message will be displayed whenever the forward and reverse DNS do not match.

## Why Bother?

We want our hosts to be able to respond to our user's requests. The problem with brute force login attempts, even if never successful, is that the requests consume resources that could otherwise be used to fulfill legitimate requests. When the host runs out of resources, all requests are affected.

Let's look at those configuration keywords again.

    LoginGraceTime 30
    MaxStartups 3:50:10
    PermitRootLogin no
    AllowUsers alice bob carol david

The first two do minor rate limiting of login attempts, the third aims to protect the superuser account, and the fourth prevents needless lookups against your system's authentication subsystem.

Rate limiting helps reduce the possibility of ephemeral port exhaustion, without [tweaking the kernel's runtime settings](https://blog.box.com/blog/ephemeral-port-exhaustion-and-web-services-at-scale/) with `tcp_tw_reuse` or `tcp_tw_recycle`. While effective, these methods could potentially impact users utilizing low bandwidth or high latency connections. We could increase the number of ephemeral ports by [modifying ip_local_port_range](https://www.nginx.com/blog/overcoming-ephemeral-port-exhaustion-nginx-plus/), but that just delays the inevitable.

As simple as these sshd\_config options are to implement, they still require the SSH daemon to interact with a client. That's not ideal since it subjects the application to far more user input than security folks would like. But what it if we could limit the behavior of bad actors before they got to processing user input?

Turns out we can.

## Using TCP Wrappers

Note: There was [talk of removing TCP Wrappers and libwrap support](https://lwn.net/Articles/609321/) from OpenSSH 6.7 in favor of other configuration parameters. This section is included primarily for historical context.

[TCP Wrappers](https://en.wikipedia.org/wiki/TCP_Wrapper) is a host-based network ACL system built in to many Linux systems and applications, better known by its configuration files `/etc/hosts.allow` and `/etc/hosts.deny`. By editing these simple text files, administrators can restrict access to network services. For example, placing the following line in `/etc/hosts.deny` would deny any host whose domain ended in example.com access to the FTP server.

    vsftpd : .example.com

But who wants to edit configuration files by hand at all hours of the night?

[DenyHosts](http://denyhosts.sourceforge.net/) is a long-running daemon that parses system logs for failed login attempts and then adds the offending IP or hostname to `/etc/hosts.deny` for a configurable period of time. By default DenyHosts will block an IP after 5 failed login attempts to non-existent user accounts, after 10 failed login attempts to a user listed in `/etc/passwd` (not including root), or on the first failed attempt to root. IP addresses remain banned for 4 weeks.

    # DenyHosts: Fri Aug  5 15:29:42 2016 | sshd: 42.81.45.235
    sshd: 42.81.45.235
    # DenyHosts: Fri Aug  5 15:29:42 2016 | sshd: 69-174-149-8.lfytina1.metronetinc.net
    sshd: 69-174-149-8.lfytina1.metronetinc.net
    # DenyHosts: Fri Aug  5 15:29:42 2016 | sshd: 221.210.200.245
    sshd: 221.210.200.245

The SSH server consults the entries in `/etc/hosts.deny` before allowing a new connection. When the server denies an SSH client connection on account of TCP Wrappers, the system log will look like this.

    Aug 14 05:24:12 genesis sshd[29021]: refused connect from 221.194.44.218 (221.194.44.218)
    Aug 14 05:24:52 genesis sshd[29023]: refused connect from 116.31.116.45 (116.31.116.45)

It's wildly effective. In less than a month DenyHosts detected and blocked nearly 300 hosts, sparing my test server's SSH server from having to process tens of thousands of login requests. No manual intervention was required and during that time there were zero false positives.

As great as that sounds, the daemon still had to be involved with the connection refusal process. It's far more efficient to drop requests before they reach the application.

Let's do that.

## Using iptables

[iptables](https://en.wikipedia.org/wiki/Iptables) can be scary.

We depend on iptables to limit remote access to specific applications, perform rate-limiting on incoming and outgoing network traffic, create the [Upside-Down-Ternet](http://www.ex-parrot.com/pete/upside-down-ternet.html), and occasionally lock ourselves out of our own system. A healthy respect for iptables is a good thing.

[Fail2ban](http://www.fail2ban.org) parses system logs for login failures in a similar fashion as DenyHosts, except that it adds rules instructing iptables to drop traffic from malicious hosts. It works out of the box with minimal configuration, but I prefer two small customizations.

Here's my example `/etc/fail2ban/jail.local` configuration file:

<pre>
[ssh-iptables]
enabled  = true
filter   = sshd
action   = iptables-multiport-log[name=SSH, port=ssh, protocol=tcp]
      sendmail-whois[name=SSH, dest=alex@example.com, sender=fail2ban@genesis.example.com, sendername="Fail2Ban"]
logpath  = /var/log/secure
maxretry = 5
bantime  = 604800
</pre>

Here, I use the sshd filter which detects login failures in `/var/log/secure` based on [an array of regular expressions](https://github.com/fail2ban/fail2ban/blob/0.10/config/filter.d/sshd.conf). When a host is banned, its IP is added to an iptables chain suffixed with "SSH", the failure is logged (see below), and a [WHOIS](https://en.wikipedia.org/wiki/WHOIS) report is sent to me. The ban remains in place for 7 days.

    Sep  1 19:57:29 genesis fail2ban.actions[27458]: WARNING [ssh-iptables] Ban 208.67.1.151
    Sep  1 20:17:28 genesis kernel: fail2ban-SSH:DROP IN=eth0 OUT= MAC=XXX SRC=208.67.1.151 DST=203.0.113.27 LEN=48 TOS=0x00 PREC=0x00 TTL=120 ID=32615 PROTO=TCP SPT=43577 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0

Note: Fail2ban can detect more than just failed login attempts. There are [several dozen filters](https://github.com/fail2ban/fail2ban/tree/0.10/config/filter.d) that can detect a wide variety of malicious behavior and [just as many actions](https://github.com/fail2ban/fail2ban/tree/0.10/config/action.d) that the application can be configured to take.

I rely on iptables to protect my host and don't make frequent changes to firewall rules, so I was initially skeptical about having an application make changes on the fly. After seeing how Fail2ban works, I've come around. No permanent changes to your firewall rules are made nor are existing rules affected. Upon startup, Fail2ban inserts a new target rule at the top of your `INPUT` chain. Upon shutdown, Fail2ban cleans up after itself very precisely.

In this example all inbound SSH traffic is sent to the `fail2ban-SSH` target chain. The `in_internet` chain which handles the bulk of my network ACL is unaffected.

<pre>
[root@genesis ~]# iptables -L INPUT
Chain INPUT (policy DROP 0 packets, 0 bytes)
pkts bytes target     prot opt in     out     source               destination       
 157K 9551K fail2ban-SSH  tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           multiport dports 22
2655K  230M fail2ban-BadBots  tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           multiport dports 80,443
4595K  881M ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0         
3084K  318M in_internet  all  --  eth0+  *       0.0.0.0/0            0.0.0.0/0         
   1   112 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED
  12   556 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           limit: avg 1/sec burst 5 LOG flags 0 level 4 prefix `'IN-unknown:''
  12   556 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0         
</pre>

During operation, rules are added to and removed from the relevant target chains. The main `INPUT` chain isn't affected.

After running for a while, the `fail2ban-SSH` chain looks like this. We can see a few dozen hosts that have been banned as well as the number of packets and number of bytes they have attempted to send.

<pre>
[root@genesis ~]# iptables -L fail2ban-SSH -v -n
Chain fail2ban-SSH (1 references)
pkts bytes target     prot opt in     out     source               destination         
  20  1268 fail2ban-SSH-log  all  --  *      *       222.187.222.83       0.0.0.0/0
  19  1484 fail2ban-SSH-log  all  --  *      *       210.242.196.142      0.0.0.0/0           
   4   184 fail2ban-SSH-log  all  --  *      *       38.130.106.6         0.0.0.0/0           
  34  2380 fail2ban-SSH-log  all  --  *      *       113.163.33.112       0.0.0.0/0           
 864 52184 fail2ban-SSH-log  all  --  *      *       125.212.225.107      0.0.0.0/0           
  35  2512 fail2ban-SSH-log  all  --  *      *       208.67.1.151         0.0.0.0/0           
  82  5264 fail2ban-SSH-log  all  --  *      *       58.220.5.28          0.0.0.0/0           
  19  1712 fail2ban-SSH-log  all  --  *      *       61.153.110.129       0.0.0.0/0           
  15  1088 fail2ban-SSH-log  all  --  *      *       108.31.35.87         0.0.0.0/0           
  22  1564 fail2ban-SSH-log  all  --  *      *       173.242.121.52       0.0.0.0/0           
  48  2704 fail2ban-SSH-log  all  --  *      *       193.201.225.54       0.0.0.0/0           
  22  1664 fail2ban-SSH-log  all  --  *      *       217.113.8.170        0.0.0.0/0           
 202 16052 fail2ban-SSH-log  all  --  *      *       115.146.126.168      0.0.0.0/0           
  88  5684 fail2ban-SSH-log  all  --  *      *       154.16.199.49        0.0.0.0/0           
  32  2264 fail2ban-SSH-log  all  --  *      *       210.73.208.201       0.0.0.0/0           
  18  1008 fail2ban-SSH-log  all  --  *      *       183.91.22.86         0.0.0.0/0           
 110  6964 fail2ban-SSH-log  all  --  *      *       57.73.56.212         0.0.0.0/0           
  88  5616 fail2ban-SSH-log  all  --  *      *       120.26.240.180       0.0.0.0/0           
  63  3192 fail2ban-SSH-log  all  --  *      *       195.154.46.216       0.0.0.0/0           
  85  5444 fail2ban-SSH-log  all  --  *      *       120.27.25.236        0.0.0.0/0           
  13   552 fail2ban-SSH-log  all  --  *      *       212.129.52.127       0.0.0.0/0           
  87  5632 fail2ban-SSH-log  all  --  *      *       91.247.228.74        0.0.0.0/0           
  19  1072 fail2ban-SSH-log  all  --  *      *       125.211.216.157      0.0.0.0/0           
 126  6700 fail2ban-SSH-log  all  --  *      *       185.12.231.66        0.0.0.0/0           
6636  398K fail2ban-SSH-log  all  --  *      *       116.31.116.48        0.0.0.0/0           
  21  1856 fail2ban-SSH-log  all  --  *      *       146.0.77.222         0.0.0.0/0           
 156  9772 fail2ban-SSH-log  all  --  *      *       195.154.67.196       0.0.0.0/0           
  25  1872 fail2ban-SSH-log  all  --  *      *       134.226.55.214       0.0.0.0/0           
  47  2232 fail2ban-SSH-log  all  --  *      *       193.201.225.135      0.0.0.0/0           
  20  1720 fail2ban-SSH-log  all  --  *      *       218.65.30.170        0.0.0.0/0           
  18  1032 fail2ban-SSH-log  all  --  *      *       162.144.198.203      0.0.0.0/0           
  21  1408 fail2ban-SSH-log  all  --  *      *       155.94.142.13        0.0.0.0/0           
  27  1952 fail2ban-SSH-log  all  --  *      *       220.181.167.182      0.0.0.0/0           
  15  1524 fail2ban-SSH-log  all  --  *      *       88.207.35.189        0.0.0.0/0           
  97  4900 fail2ban-SSH-log  all  --  *      *       185.110.132.87       0.0.0.0/0           
143K 8623K RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           
</pre>

When a banned source IP is matched the traffic is directed to another chain called `fail2ban-SSH-log` which performs rate-limited logging before rejecting the traffic. Logging is rate-limited to prevent a [DDOS](https://en.wikipedia.org/wiki/Denial-of-service_attack) attack from filling up our storage space with logs.

<pre>
[root@genesis ~]# iptables -L fail2ban-SSH-log -v -n
Chain fail2ban-SSH-log (35 references)
pkts bytes target     prot opt in     out     source               destination         
5338  324K LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           limit: avg 6/min burst 2 LOG flags 0 level 4 prefix `fail2ban-SSH:DROP '
10331  630K REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           reject-with icmp-port-unreachable
</pre>

The detection criteria of Fail2ban differs slightly from DenyHosts, but the end result is just as satisfying, forbidding malicious hosts from making connection attempts long before they reach the application.

Stay safe, friends.

<!-- EOF -->
