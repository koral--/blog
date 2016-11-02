---
title: Xamarin VM updates - Xcode 8.1 and macOS Sierra
date: 2016-11-02 13:42 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

All except the Xamarin LTS (long term support) stacks were upgraded,
and are built on the current Xcode 8.1 stack.

This means that Xamarin stacks (except the LTS one) now have Xcode 8.1,
as well as that the OS is now macOS Sierra instead of the previous El Capitan.

The Virtual Machines replaced the previous Xamarin (non LTS) configurations,
so __if you've already selected a non LTS Xamarin stack for your app, you're automatically using the new stack now__.

__Full update logs:__

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/87/commits/97c0e337869e1e92a9c9085caf3d205a7a1ae251) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/87/commits/8c60852c797776e37ed40ec2f0e22f7ccb461967) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/87/commits/6533b84ff7fee2245a6e6cb24d637f4c4fa38718) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)

If you'd like to add a tool to be pre-installed on our Stacks
you can find all the required information at:
[https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed).

**Happy Building!** 🚀
