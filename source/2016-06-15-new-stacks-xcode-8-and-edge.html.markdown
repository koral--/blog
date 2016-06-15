---
title: 'New Stacks: Xcode 8 and "Edge"'
date: 2016-06-15 15:43 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Xcode 8 stack

The first beta of `Xcode 8` is now available on [bitrise.io](https://www.bitrise.io/)!!

This stack brings **lots** of updates in addition to the new Xcode version,
a very short summary:

* Ruby: `2.3.1`
* Node.js: `6.2.1` and NPM `3.9.3`
* CocoaPods: `1.0.1`
* fastlane: `1.94.1`

You can find the full system report, with all the pre-installed tool versions
[on GitHub](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log).

Unfortunately there's one tool we had to remove: `wine`.
We had troubles with `wine` before (more than with every other tool, combined),
and this time we couldn't find any reliable workaround to be able to install it alongside of Xcode 8.
You can of course still use `wine` on the Xcode 7.3 stack if you need it, and we'll see
if we can add it again in the future.


## Xcode "Edge" stack??

Start with the TL;DR:

This stack will be updated (re-built) on every weekend,
upgrading the pre-installed tools to the latest versions.
The installed Xcode on this stack is the latest **stable** Xcode version (this time `7.3.1`).

**Why do we introduce this stack?**

Every project and every team is different. We have and experimented with different update schedules:
the Android stack is re-built every week, the Xamarin stacks receive Xamarin updates
on every weekend, but not other pre-installed tool updates (not a full re-build)
and the (native/iOS) Xcode stacks are updated only when a new Xcode patch version is
available for that particular Xcode version (e.g. in case of the Xcode 7.3 stack,
it was re-built when Xcode 7.3.1 was released).

This Xcode "Edge" stack is meant to provide an environment for those who want to use the
latest stable Xcode version and the latest (stable) version of every other tool, like
CocoaPods, `fastlane`, ...

*Why it's built on Xcode stable? Because the Xcode beta stacks are re-built
for every new Xcode beta version anyway - if Apple keeps their regular Xcode beta schedule
this means every second week.*

So, as a summary, **if you need stability / no changes in the environment then this stack is not for you**.

On the other hand, **if you love to always use the latest-and-gratest** and
you don't mind it if you have to upgrade your
configurations when a new version of a tool breaks your workflow,
then this is definitely the macOS stack for you!

This stack will also serve as our "alpha" or "test" stack, to catch issues early on (like
the incompatibility between Ruby 2.3 and CocoaPods 0.39).

There's one more thing to note: as you (hopefully ;) already know it (we add this to every stack update post)
you can [send us Pull Requests](https://github.com/bitrise-io/osx-box-bootstrap#request-a-tool-to-be-pre-installed)
into the repositories which include the stack provisioning scripts.
Once your pull request is accepted the next version of the stack will include the
tool you added, as a pre-installed tool.

The problem in case of the macOS stacks was that these stacks were only updated /
re-built when a new Xcode version was released. So even if your tool PR was accepted
you had to wait (potentially) many weeks to see it pre-installed.

From now on, when the PR is accepted, you'll have it in that week's "Edge" macOS stack!

Happy Building everyone!
