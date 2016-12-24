---
title: Weekly VM updates - Xcode 8.2.1 on Xamarin and Edge, Android Emulator tweaks
date: 2016-12-24 12:25 UTC
tags: announcement, status, box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Highlights

__Xamarin and Xcode Edge__: Xcode 8.2.1 is now the preinstalled Xcode version on all Xamarin stacks (except the LTS one),
as well as on the Xcode Edge stack.

__Xamarin__ stacks were also updated to the latest Xamarin channel updates.

The __Android__ stack received one more Emulator related update,
[the `QT_QPA_PLATFORM` and `LD_LIBRARY_PATH` environment variables are now set by default](https://github.com/bitrise-docker/android/pull/49/files),
to allow the latest Android Emulators to boot in both window and `-no-window` mode,
without any customization in your build configuration.


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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/6b8eb0b49d98cbfc64ff6b16ea59b7bdea44e346) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.2.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/ce087252b379a5c2e477da09a13bcc87f4794352) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.2.x.log)
* Xcode 8.1.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/c9a1b0404c703d882adec2b31d4bce642883bc85) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/95bc5d2c9fc8e927ee536e2bd76a1421cff4511c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/0bb8d098d6431911bb5ce11bdfbd534c9d02b575) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/f07da3b60a20873d6126bae72fcdc1d92d497e67) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/5709683c05076fc1667ed91ba5c9fca195974fe2) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android LTS (Long Term Support) (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/9ac772b17ba4a89493459d11dac2e53a778acad4) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the macOS stacks, so the dependency manager cache updates are applied
on these stacks too (see the `macOS stacks -> Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/917c4660bb65e0bf28b0b9bab2a40e3c66f054b7) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/03d20aada484a2df86cc568d708c04e19ab8b99c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/dfc243a4cda2690d13052d2c57e6291c0332dec1) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)
* Xamarin Stable LTS (Long Term Support): [diff](https://github.com/bitrise-io/bitrise.io/pull/109/commits/fdd77d0d54d8d3e691f9918e236b815f19a26983) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the macOS stacks.

**Happy Building!** 🚀
