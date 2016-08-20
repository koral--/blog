---
title: Weekly VM updates - privileged Docker run, NodeJS 6.4 and Go 1.7
date: 2016-08-20 08:27 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Summary

Probably the most significant change is that we now run the Linux/Android docker images
with the `--privileged` flag (`docker run --privileged ..`).
This was an important step, to allow you truly full control on the Linux/Android stack,
which can be required to [configure a VPN connection](https://github.com/bitrise-docker/bitrise-base/issues/26)
for example.

__This does not affect your builds' security__, as we don't run more than one Docker container
on a Build virtual machine, and the whole virtual machine is discarded after the build, not just
the Docker container.

Additional tool highlight: the Android/Linux stack and the Xcode Edge stack
now have `NodeJS` v6.4, and `Go` 1.7 preinstalled,
as well as `fastlane` v1.101.0.


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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/59/commits/6983e42c74d6113589479c8be789aa1928dfc2b0) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/59/commits/d590b96379f8163c91f51a77849f9c281b295090) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/59/commits/ec6304ffad7ee6aa10087946b349d15a5ab977a7) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/59/commits/6d2e80d8bab682f7fcb8d61530d050b52b361964) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/59/commits/cbf818b239ca89f82da803676c610bd7ff4bcfd4) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Ubuntu 16.04: [diff](https://github.com/bitrise-io/bitrise.io/pull/59/commits/d01b1e15855b6c757d007de44a28b670359c4372) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/59/commits/d1136393a17c5d8cfebe7f88cf6ea02e92dcf326) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/59/commits/72f9d53105ad857e580b3ec15bcdb33bd4fa5e16) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/59/commits/215605ec4a031d2c3b3c77d0b9dc56db08eb569f) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.

**Happy Building!** 🚀
