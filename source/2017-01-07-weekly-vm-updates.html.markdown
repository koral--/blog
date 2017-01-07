---
title: Weekly VM updates
date: 2017-01-07 13:28 UTC
tags: announcement, status, box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Highlights

- Preinstalled `cordova` and `ionic` CLIs (`npm install -g`) on the __Android/Linux stack__ ([pr](https://github.com/bitrise-docker/android/pull/54/files)) and on the __Xcode Edge stack__ ([pr](https://github.com/bitrise-io/osx-box-bootstrap/pull/31/files)).
- For now we don't preinstall Ruby 2.4 anywhere, not even on the Edge stack, as it has too many issues (see [this CocoaPods issue report](https://github.com/CocoaPods/CocoaPods/issues/6299) for example). Instead we opted to preinstall `homebrew/versions/ruby23` ([pr](https://github.com/bitrise-io/osx-box-bootstrap/pull/30/files)) on new macOS Stacks for now.
- Xamarin Alpha update to [https://releases.xamarin.com/alpha-preview-7-cycle-9/](https://releases.xamarin.com/alpha-preview-7-cycle-9/)

_For the full list of changes please check the `diff` of the stacks below._

_Join this Stack update's discussion on
[discuss.bitrise.io](https://discuss.bitrise.io/t/weekly-virtual-machine-stack-updates-2017-01-07/130)_

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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/e44b735d3da3c93308bff66fb8b5a3a115ac5c4b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.2.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/c00d352334d4adfd06aa122716e572d562607ac4) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.2.x.log)
* Xcode 8.1.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/044515e7ec78c005f29a95eac538270f709ec78b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/2520431ce006855dd827f377f08fb5c1b49bf43b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/57af3b3a60fec9ad3f400e186e8068ad4a21d187) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/701dbb77228c300ae4c1b7b64882478b283e818f) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/e90ea605ba27f9f13e41b8a4d8e255fe9ae47377) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android LTS (Long Term Support) (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/d5a6e33a50d0948e133010dd8d5f07d7fe58419e) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the macOS stacks, so the dependency manager cache updates are applied
on these stacks too (see the `macOS stacks -> Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/6c6d9549f43d0f104f7cea2077a1f46136c3caf2) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/fc7337351f5a8f8126140da59a2ddddb64998609) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/083f3a32375862085a15315b58dd3c8dc6132b74) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)
* Xamarin Stable LTS (Long Term Support): [diff](https://github.com/bitrise-io/bitrise.io/pull/113/commits/98db587da7c26601320d33219f6ee305d1f1ecbe) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the macOS stacks.

**Happy Building!** 🚀
