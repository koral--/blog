---
title: Weekly VM updates - Bitrise CLI 1.3.6 and Node.js on Linux
date: 2016-07-16 11:03 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Summary

As usual a new [Bitrise CLI](https://github.com/bitrise-io/bitrise)
version was published on the second Tuesday of the month (this last Tuesday),
and as there was no show-stopper issue we updated the VMs this weekend to use the
latest Bitrise CLI version: `1.3.6` 🎉

You can read more about the new CLI version in our previous blog post:
[Monthly release of Bitrise CLI (July)](/2016/07/13/monthly-release-of-bitrise-cli-july.html).

One more notable update: the Android / Linux stack now has Node.js v6 pre-installed! 😱
The Node.js version right now is the same on the macOS "Edge" stack and on the
Linux / Android stack (`v6.3.0`) and will be updated on both at every weekend.


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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/46/commits/a5b3a8e7dab7e23d6cab330d4036a275d30f8d3d) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/46/commits/15f6e1440b33d735583cefd7a2e49bc84c28300a) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/46/commits/82c5715cff4e8f229ded6e9ed0791fe6f5b7335c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/46/commits/5ed1761880355baa5070576475097b6c33a522bd) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/46/commits/cfe7fc7b560dfa3cf7b9f3fdce5bb918856a58f6) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Ubuntu 16.04: [diff](https://github.com/bitrise-io/bitrise.io/pull/46/commits/a39d8412ccfa18d492e81989c279e83938d6a4aa) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/46/commits/b9c04b0853e2e853ce81846171ee9c6e4ac04e93) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/46/commits/1ab2102719f0cee6b9ed2c19069fd959eef47e2a) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/46/commits/18b957b9ba1f75c907b11272d479061829c4e21d) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.
