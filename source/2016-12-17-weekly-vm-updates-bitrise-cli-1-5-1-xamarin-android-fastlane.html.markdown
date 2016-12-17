---
title: Weekly VM updates - Bitrise CLI 1.5.1, Xamarin, Android, fastlane
date: 2016-12-17 11:45 UTC
tags: announcement, status, box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Highlights

__Bitrise CLI 1.5.1__ was released (see
[this announcement blog post for more details](/2016/12/14/monthly-release-of-bitrise-cli-dec.html)),
and is now available on every [bitrise.io](https://www.bitrise.io) stack!

__Android package changes__ (applies for both the Android/Linux and for the Xamarin stacks):

- The `extra-android-support` package was removed from the Android packages registry, it is no
  longer available and can't be installed from the SDK manager. This package is no longer
  available on the Android/Linux, nor on the Xamarin stacks (except on the LTS ones).
  You can find more information about this and how to upgrade from this android package
  in our [previous blog post](/2016/12/13/android-extra-android-support-no-longer-available.html).
- The new `build-tools-25.0.2` package is now preinstalled on both the Android/Linux
  and on the Xamarin stacks.

__Xamarin stacks now have Xcode 8.2__: Xamarin stacks (except the LTS one) now have
Xcode 8.2, instead of 8.1. macOS was also upgraded to the latest 10.12.2 version.

__Xcode 8.2 stack and Edge stacks__: the Xcode 8.2 stack got a minor update too,
it's now on the latest macOS version (10.12.2) and has the Xcode 8.2 Command Line Tools
installed. This is also true for the Edge stack, which is always built on the latest
stable Xcode base virtual machine image, which from now on is the Xcode 8.2 one.

__fastlane__ bumped their version number to 2.0! You can of course upgrade `fastlane`
on any stack, but `fastlane` 2.0.x is the preinstalled version on both the
_Xcode Edge_ and the _Android/Linux_ stacks, you don't have to upgrade
or install it on these stacks.


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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/3f232df88084e665d5a9ea71f38b8c28dc5236e8) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.2.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/663fa8832e6957488326365eada22bba13c3c2b7) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.2.x.log)
* Xcode 8.1.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/856116e7b0d52b84e6a91154bc1eae0e0783fcf1) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/c07e98f9c11dea348369a45920ebf1b38ffcb771) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/b02c00f1a3abc68452ce74e86cdbc1cfde0167d8) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/806fc50cbd461175927cab47b808fe81605cf39f) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/0785f7a8657202613dca5f34d9a580a37c1c69e4) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android LTS (Long Term Support) (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/4a6b497ebad0c197b1bc7e005394583131078eb1) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the macOS stacks, so the dependency manager cache updates are applied
on these stacks too (see the `macOS stacks -> Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/f58211aab24d75c9aec5c2cdb98debb009a9d10e) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/a85b0a379b6607ab6f42314de0f0cfa7576df022) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/d57971ea8a59790e8dd6340f21849bf343b9e66c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)
* Xamarin Stable LTS (Long Term Support): [diff](https://github.com/bitrise-io/bitrise.io/pull/106/commits/ea54309dc226051e7124fe12adc39cf121c6c136) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the macOS stacks.

**Happy Building!** 🚀
