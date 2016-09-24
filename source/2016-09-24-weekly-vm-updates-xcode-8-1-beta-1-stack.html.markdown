---
title: Weekly VM updates and Xcode 8.1 (beta 1) stack
date: 2016-09-24 11:58 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Summary

This week's most most significant change is that we added a new Stack option:
`Xcode 8.1.x`. This Stack, just like the `Xcode 8.0.x` one, will be
updated to have the latest Xcode 8.1 version, including the betas.
Right now Xcode 8.1 beta 1 is installed on the Stack.

__This is a new Stack__, which means that
__you'll have to select it manually__
for your app if you want to use it (you can change your app's stack on its `Settings` tab)!

Also, as noted in Xcode 8.1 beta's [Release Notes](http://adcdownload.apple.com/Developer_Tools/Xcode_8.1_beta/Release_Notes_for_Xcode_8.1_beta.pdf),
__a couple of simulators are missing__, namely:

- iOS: 10.0, 9.3
- watchOS: 3.0, 2.2
- tvOS: 10.0, 9.2

You can see what's new in this Stack compared to the Xcode 8.0.x stack
[in this GitHub diff](https://github.com/bitrise-io/bitrise.io/pull/72/commits/27f8068b030022ed06093ca2e8328a20ffd4272a),
and the full system report of the stack [here](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log).


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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/71/commits/254b0fec00d317c660319b54797125c64aa68734) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.1.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/72/commits/27f8068b030022ed06093ca2e8328a20ffd4272a) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/71/commits/8e164d7b381f95968ed139c8faf06bb31e900603) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/71/commits/0d57e355502e284f7bf9b29bcf3322eeb8df36f5) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/71/commits/eb58d5b811211ee0e5a59929eded2f36330be01b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/71/commits/8e1f4cd2627a952cf6e6e1eea4d9712296e49655) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/71/commits/5d2ac7b6b5ecb5efe245afb6a1eb9fe8285c557e) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android "LTS" (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/71/commits/ce260f7a992ba1da6496f1c88205353dac5376e1) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/71/commits/9440ef9c9483631cf071f109bb5b350d0eddf99e) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Stable LTS: [diff](https://github.com/bitrise-io/bitrise.io/pull/71/commits/e454010f3cfe9ec2e9ed1f93280583fcd610fccd) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/71/commits/75861858ac4ea854d42e2ed29ff8ef120b8932bb) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/71/commits/ed91330b28d5114134bf5da8243ea720416c79ec) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.

**Happy Building!** 🚀
