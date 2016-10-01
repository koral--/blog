---
title: Weekly VM updates - Xamarin updates
date: 2016-10-01 10:16 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Summary

Pretty much the only significant change this week is that
Xamarin Stable and Xamarin Beta had updates, which are now
available in the Bitrise.io Xamarin VMs.


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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/64b2202e311371d5fd283ef5826a0a8b788eb38c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.1.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/f837db8df40c406cbdabb95cf3ef5df2de4ec80f) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/766fd68524e8d888adefa82c984b3939a66e8d5b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/2ab5e53bd80359c4f96dd4b2e65d4b84b88de387) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/a11f6ea4099dbf613f5695bb3d622306d0b6d3b4) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/de2dcf0f5e33e85c88040100d296db36db7d72b2) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/c713b4f7ee4d5cb42122d3819e0e039c41edba8d) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android "LTS" (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/915ef6e512f6a83fac6ca0a19dccdff4fe24a4fd) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/c97a4578dc24fd1b70a197239500124b6ff5870c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Stable LTS: [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/b29297a550fe2309d0f396d137997c6a11474897) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/a51788e2d07adfabf82fa6d3bcbf2315030b7fa3) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/73/commits/aed53fe709d730b6909ee9adb3ced41eb8e597cc) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.

**Happy Building!** 🚀

