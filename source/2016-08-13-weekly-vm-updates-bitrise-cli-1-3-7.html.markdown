---
title: Weekly VM updates - Bitrise CLI 1.3.7
date: 2016-08-13 08:39 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Summary

As usual a new [Bitrise CLI](https://github.com/bitrise-io/bitrise)
version was published on the second Tuesday of the month (this last Tuesday),
and as there was no show-stopper issue we updated the VMs this weekend to use the
latest Bitrise CLI version: `1.3.7` 🎉

You can read more about the new CLI version in our previous blog post:
[Monthly release of Bitrise CLI (Aug)](/2016/08/09/monthly-release-of-bitrise-cli-aug.html).

Also, thanks to [@bootstraponline's PR](https://github.com/bitrise-io/osx-box-bootstrap/pull/18)
the Mac OS Stack reports now include all the preinstalled Ruby gems & versions (`gem list`)!


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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/58/commits/1c268c0bb391642d9b3e5ce94e5ab82430054cc2) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/58/commits/14f973534bdd4f4e542bca64dd4cac93e99f6cae) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/58/commits/5105bf87f474650a1151fd41e3a751a981951183) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/58/commits/57821e7cfc4445dbac4db35d3c2fab3e9bac8391) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/58/commits/be4b4171b24b5d3ee7d230dd54174e4c21e80527) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Ubuntu 16.04: [diff](https://github.com/bitrise-io/bitrise.io/pull/58/commits/66b8bf3a3ddb3f27c63c0ff01a8ec93ab8afc273) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/58/commits/258e8b71157ace3cb953d2c5640d93b7bdf38f02) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/58/commits/81d5b9016d8af591f13201fa42beb55b75d62bf1) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/58/commits/be39af3056dca359c3c384fe747c5b28bfebe149) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.

**Happy Building!** 🚀
