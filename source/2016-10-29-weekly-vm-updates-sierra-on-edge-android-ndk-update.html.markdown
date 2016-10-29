---
title: Weekly VM updates - Sierra on Edge, Android NDK update
date: 2016-10-29 09:39 UTC
tags: announcement, status, box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Highlights

We finally managed to update every core step for macOS Sierra,
and __the current `Xcode Edge` stack is now built on top of macOS Sierra__, with
Xcode 8.0 installed on it (at the time we prepared it Xcode 8.1 was still
just in GM, next week Edge will have Xcode 8.1 final).

A couple of notes: Sierra changed a few things, especially for keychain management,
so if you want to use the new Edge stack you'll have to upgrade the
`Certificate and profile installer` step to the latest version.
Otherwise your build will __"hang"__ when Xcode tries to sign your code,
due to a permission popup, where you should manually click "Allow".
The latest `Certificate and profile installer` step
has a fix for this, enabling the installed certificates to be used
without manual intervention. _This might affect other tools as well unless they were upgraded
to handle the change Sierra brought!_

Unfortunately __`xctool` had to be removed from the Edge stack__,
as it seems it's not (yet) compatible with macOS Sierra,
at least not how `brew` installs it. Of course you can install `xctool`
yourself if you want to, just like [any other tool which is not preinstalled](https://bitrise-io.github.io/devcenter/tips-and-tricks/install-additional-tools/).

__The Android/Linux stack__ was updated to have the latest
Android NDK, thanks to [@mickele](https://github.com/mickele)'s
[Pull Request](https://github.com/bitrise-docker/android-ndk/pull/19).
Additionally he also added [Android Studio's CMake as a preinstalled tool](https://github.com/bitrise-docker/android-ndk/pull/20).
Thanks [@mickele](https://github.com/mickele) for your help! 🚀

Last but not least, __Xamarin__ stacks were updated to use
the latest Xamarin versions, just like every week when a new
Xamarin update is released.

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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/d8ad16ec5c06ac62950453cba9b1c3bbf7c6c8e2) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.1.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/dc8d66d3a268ce3d64392a5ff223c6f2b503abb7) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/44d897c99615b0e386889c5b3a69b8ebac8e5675) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/9fdb50d4c2096bf7ab518003fbad64efdf22ce5e) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/f920d921bb9eff637227c60d22a9feffb0b305df) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/d237f8215c804926d0aaf12165a48348300a961c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/dd16940929f3dba1b4c4aa3dd0873bdb4b036c95) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android "LTS" (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/eba8ddad7c86ac12f0a524576779dd549eaae245) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the macOS stacks, so the dependency manager cache updates are applied
on these stacks too (see the `macOS stacks -> Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/f9a94f29cd33df694b1a8d819940d53e3cdc27c3) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Stable LTS: [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/d0ace75dbddbdcc0f7b7234c7fa3a8b21321adcf) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/1081d34778b50faa6ca456fb98e27300ac102192) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/85/commits/7fd86e30c63c910714bf157f2e663d40528bcaab) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the macOS stacks.

**Happy Building!** 🚀

