---
title: Weekly VM updates - New CLI, Updated Xamarins, Edge, 7.3 .. Oh my!
date: 2016-09-17 11:12 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Summary

Well, where to start.. This week was packed with updates on all stacks!

First of all, __all of our stacks now have the latest-and-greatest Bitrise CLI version__
(`1.4.0`) installed, which came with quite a few new features -
you can read more about what's new in `1.4.0` in our
[Monthly release of Bitrise CLI (Sept)](/2016/09/13/monthly-release-of-bitrise-cli-sept.html) post.

In addition to the new CLI version, the __Xamarin stacks__ were upgraded
and have `Xcode 8` preinstalled, on all three stacks/channels (stable, alpha and beta),
and of course all three stacks were upgraded to use the latest Xamarin versions!

There's also a __new Xamarin stack__, for those who are not thrilled by
continuous updates: the `Xamarin Stable LTS` stack is the exact same
environment you had this week as Xamarin Stable.
This means that it comes with Xcode 7.3.1 instead of Xcode 8,
as well as `Xamarin.iOS` v9 instead of v10 and `Xamarin.Android` v6 instead of v7.

The __Xcode 8.0.x stack__ was updated [during the week](/2016/09/14/xcode-8-0-final-available.html),
so that it now has the final Xcode 8.0.

__Xcode Edge__ now also has Xcode 8.0 instead of Xcode 7.3.1; to keep it true to what the stack's
description states: "This Edge stack includes the latest __stable__ Xcode version."
The Edge stack also joined the other new stacks in that it now has 200 GB storage,
from which about 120 GB is free.

__Xcode 7.3 stack__: The last update is related to the `Xcode 7.3.x stack`, which received a minor MacOS update,
so now it runs on the latest MacOS El Capitan version (10.11.6).
There's one more thing to note about this stack, now that Xcode 8.0 is
released Xcode 7.3 won't receive new updates from Apple, and so
__this stack now joins 6.4 and 7.2 as an LTS (Long Term Support) stack__,
which means that if you need a really predictable environment,
where only caches and the Bitrise CLI are updated but the
pre-installed tool versions are always the same / won't be updated, you can
now use the `Xcode 7.3 stack` too!


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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/69/commits/6a910aef1b0f7a6820645ce268fced28b4a91762) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/69/commits/970445e185b5e07efd8a7d1314d2a26d5ddb202b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/69/commits/53ad1cb7f7016deddb136e00c57d4632d3594f95) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/69/commits/0911192acf290b82bc48b8916c28c066ac5505ad) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/69/commits/df6383e29ba65a6c607eb59aca969718c9a9ef9b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/69/commits/2f7e0afcc085ce4fc21a3a3019d081045cdeeb51) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android "LTS" (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/69/commits/dd60d03945dbd36464dcdae21ccf6746d69f8600) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/69/commits/03588475d31e4d6515cc9abc5258790eb0db5b19) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Stable LTS: [diff](https://github.com/bitrise-io/bitrise.io/pull/69/commits/64b854a3c5ab22efdf3e5eabebadcd9cd19598d7) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/69/commits/49bc2fa1b47a74c11138895d4319c1116f3f726e) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/69/commits/f073f9adacfe09c1ce86d84a4875072605c46cb7) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.

**Happy Building!** 🚀
