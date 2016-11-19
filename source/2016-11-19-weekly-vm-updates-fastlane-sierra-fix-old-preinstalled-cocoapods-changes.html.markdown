---
title: Weekly VM updates - fastlane Sierra fix, old preinstalled CocoaPods changes
date: 2016-11-19 21:07 UTC
tags: announcement, status, box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Highlights

__fastlane__:
Using __fastlane__ on a Sierra stack required a workaround before,
as on Sierra you need the keychain password to properly install the code signing
certificate / `.p12`. All of our Mac stacks now include the related environment set
by default, so you no longer have to set it yourself.
Related fastlane GitHub issue: [https://github.com/fastlane/fastlane/issues/6866](https://github.com/fastlane/fastlane/issues/6866)

__CocoaPods__:
version `0.39` and earlier are now considered deprecated,
and will no longer work out of the box, as the CocoaPods Spec repository
structure changed. The recommended solution is to upgrade your CocoaPods
version, but you can still use `0.39` or earlier using an official workaround.
You can find more information [in this CocoaPods Blog Post](http://blog.cocoapods.org/Sharding/),
and on the stacks where we had CocoaPods `0.39` preinstalled (Xcode 6.4, 7.2 and 7.3)
we applied the suggested fix (`cd ~/.cocoapods/repos/master/ && git fetch origin master && git checkout v0.32.1`),
so all you have to do is to change your CocoaPods source to the `source "https://github.com/CocoaPods/Old-Specs"` one.

__Android__ (both Android and Xamarin stack):
the previously preinstalled `sys-img-armeabi-v7a-android-23` package was removed,
because it disappeared from the available Android packages list, and it can no longer
be installed with `android update sdk`.

__Xamarin__:
The non LTS Xamarin stacks now have the `ANDROID_NDK_HOME` environment variable set,
pointing to the location of the Android NDK.
Additionally, all (non LTS) Xamarin stacks were updated to the latest version of
Xamarin, every Xamarin release channel had updates.

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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/83f39390654d0f7a0dff472ad0170e3ff17af7c7) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.2.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/ee6a74dfcd8c66f2c41cb7b073460ad14cc1ff88) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.2.x.log)
* Xcode 8.1.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/1a620c6278c470bbe22baf464046109c6cf3514f) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/b2f2118f8bda43d6ec6b8a511e593efcdf97b06d) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/1c1e797483e020b543c619bbc517f3b32f653f5f) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/57b5416e17f39dcaeecf83603c2a8c075c87ab0b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/ec5174156cac8302cdd2ee49abe491fa33c81a34) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/b481cdf51035ef6e288583f90e4eab5f806d0188) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android "LTS" (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/c2a80d6d8f55a2a92a49c041ebc3eee7aee1e21b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the macOS stacks, so the dependency manager cache updates are applied
on these stacks too (see the `macOS stacks -> Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/94c4b956fc2443a440bf023d5aa3b8e9c514ea7c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Stable LTS: [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/505feac63cb32b4a7cbb7b1d94f40de65ff16f88) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/c6a0d48709bb5c488c413534f55f79b94daccc32) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/99/commits/50f57c3f0a2f01d0a327c9d789885ef5790ea4cd) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the macOS stacks.

**Happy Building!** 🚀

