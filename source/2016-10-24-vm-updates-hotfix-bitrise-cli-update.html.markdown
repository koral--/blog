---
title: VM updates - Hotfix Bitrise CLI update (v1.4.3)
date: 2016-10-24 15:31 UTC
tags: announcement, status, box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Highlights

All VMs now have `Bitrise CLI 1.4.3` preinstalled, which includes a fix
for the random `panic: runtime error` [issue](https://github.com/bitrise-io/bitrise/issues/431).

The [1.4.3 release](https://github.com/bitrise-io/bitrise/releases/tag/1.4.3) includes
only two additional, minor changes:

* We replaced the emojis previously used as the steps' result (success/error) indicator with standard
  unicode characters, as the emojis caused layouting issues (on system the emojis were treated as
  2 character long, while on others as 3 character long). This means that the step result log lines
  should now be presented correctly and the same way on [bitrise.io](https://www.bitrise.io) and if you run the build
  locally in your Terminal / Command Line with the [Bitrise CLI](https://www.bitrise.io/cli).
* The built in Go toolkit of the CLI was bumped to use Go 1.7.3

You can find the [full release log on the CLI's GitHub page](https://github.com/bitrise-io/bitrise/releases/tag/1.4.3).

No other change was performed, but as usual we publish the full
system report list for every stack below.


## macOS Stacks

As usual, all of the macOS Stacks received a dependency manager cache (`brew`, `cocoapods` and `bitrise CLI`) update.
*These Cache updates __do not__ change the pre-installed tool versions, it's
only an update of package manager caches, for faster dependency installs.*

**The only exception is the "Edge" stack, which is re-built every week**,
so it includes the latest-and-greatest versions of the pre-installed tools,
not just dependency manager cache updates.

As everything else we use for
provisioning the macOS VMs, the weekly cache update `Ansible` playbook
[can be found on GitHub](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).

You can find this week's Stack `diff`s on GitHub:

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/3a6e9cab3a5136219b88c0f25bc6606c3b60e045) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.1.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/65546c67614f1d488955167a3254301e133a696a) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/1df417eed27527303b446fba4f9db5d71996db60) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/fee82b023065e034f6711d36e74106ba872626cc) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/bfe665150b85ce8891509e868418330586e8a89e) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/0dae31217f13876d6322d126ce06a85fe27db204) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/582911d3aa1ee0657ff130143efa1b6f0a379d08) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android "LTS" (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/575973708089c4b283f4f333c9669fdc223c2a5b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/6738c43a73435ee2635fd120b8561715a590440a) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Stable LTS: [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/6738c43a73435ee2635fd120b8561715a590440a) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/8ee71a30d05766648be1ba928e64d9f52e331b40) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/82/commits/e0c630aa52fbe9a5f2362709a706b2baf3811091) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.

**Happy Building!** 🚀

