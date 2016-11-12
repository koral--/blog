---
title: Weekly VM updates - Bitrise CLI 1.4.5
date: 2016-11-12 16:15 UTC
tags: announcement, status, box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Highlights

Bitrise CLI 1.4.5 is now installed on all of the VMs.
1.4.5 was only a quickfix release, no new features were added
compared to 1.4.4. To see what's new in Bitrise CLI 1.4.4 and 1.4.5 see:
[Monthly release of Bitrise CLI (Nov)](/2016/11/09/monthly-release-of-bitrise-cli-nov.html)

Other Bitrise VM tools were also updated (`bitrise-bridge` and `cmd-bridge`),
mostly just for dependency updates
and to recompile with the latest Go version.

_For full list of changes please check the `diff` of the stacks below!_

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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/8543b95644140a66339686cb0e90e9d5e4b544b9) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.2.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/bd5b0742604974e48393670f095c783d50243124) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.2.x.log)
* Xcode 8.1.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/4bad8641d0e08f3fb086aa98c28034e504186f3c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/bd3d7389f5ef6a9e3352276148188026eab34495) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/8c400b1c660301e10e1a39fd9d0ad9ea6ff41ab1) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/5816de31314214588e3a76e50f02d5c1c012ab45) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/bbd8885b4c07e7ae562e3e7826ba22ecd56a3992) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/a7db779e689ec878d2c80f9b8c3c8286e731c0ff) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android "LTS" (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/9a71ca0e9ad2ec669d306e6045006899fd7d13c6) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the macOS stacks, so the dependency manager cache updates are applied
on these stacks too (see the `macOS stacks -> Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/fa7a339bfc1cf950811501509075ded9d91298b0) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Stable LTS: [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/d74da4706ba00443bed5de784ab5fe7954b69a88) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/2bf14beff1df4f30b69359c0f36f520507b49867) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/94/commits/571b7c7056295fc38f77137fe936541ad3069cb2) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the macOS stacks.

**Happy Building!** 🚀

