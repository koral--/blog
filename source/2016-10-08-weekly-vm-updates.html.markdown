---
title: Weekly VM updates - Android Build Tools 24.0.3 preinstalled
date: 2016-10-08 09:01 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Summary

This week's VM udpate highlights:

* Xamarin stacks were updates to the latest Xamarin versions (as usual)
* Android `build-tools-24.0.3` are now preinstalled on the Linux/Android and on the Xamarin stacks
* `imagemagick` typo fix in `system_reports` - thanks to [@chooblarin](https://github.com/bitrise-io/osx-box-bootstrap/issues/23)


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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/bf9e9a09ebe0515767c0372e1b0256acdb89150d) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.1.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/72735b19bfbfa5489cf60c5ff1b91827be4016c4) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/669acf2b3aee404fd49e1ed24dc2de0080228103) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/1d3d0e6fe9db7f6ba46a92deb4700de7d9fad6e1) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/2f053642a92d3cf71692c397f68ed65d14f5ab3d) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/5cc4bb7344bef5bfc3a69585aaa9821344c0f772) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/cbec3113c1d7bda0312ba8ce0341754b1a79e4da) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android "LTS" (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/b3fa2bee224694a995967f7f4b90cdeaa9cc0e97) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/185e0469b84b2d828a6e5dc48f34832c5daa60f1) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Stable LTS: [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/57766a2e1be6151ca67988483120adaf8687330b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/73aa65dff09dd569e0994ee2f62213a8001ea3a2) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/75/commits/ffd2e677fb123bde38308595246d20522ee2933a) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.

**Happy Building!** 🚀

