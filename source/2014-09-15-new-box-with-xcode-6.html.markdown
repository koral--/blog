---
title: New Box with Xcode 6
date: 2014-09-15 11:54 UTC
tags: box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

New base Boxes rolling out right now.
From now on you can use both Xcode 5 and Xcode 6 for building your projects.

We've decided to set Xcode 6 as the default version for these reasons:

* In most of the cases it should be fully compatible with your Xcode 5 projects.
* To submit an iOS 8 app to the App Store Apple recommends to use Xcode 6 (GM) and for the apps written in Swift that's your only option (Swift projects can't be built with Xcode 5).
* By setting Xcode 6 as the default Xcode version for new apps' verification (when you add a new app on Bitrise) you can now safely add Swift based apps.

You can however upgrade your Xcode Steps (Build, Analyze, Archive, Unit Test) to the latest Step version which supports Xcode version selection.

If you want to keep building with Xcode 5 all you have to do is update your Step to the latest version and set **5** for the *(Optional) Xcode Version to use. Default is "6"* option.


## xctool Xcode 6 support

Right now xctool doesn't support Xcode 6 in it's latest release version.
We'll [keep an eye](https://github.com/facebook/xctool/issues/380){:target="_blank"} on this issue
and we'll update the preinstalled xctool in our VMs when the new release gets available.

In the meantime if you want to use xctool you'll have to use it with Xcode 5.

> If you have any problem with the new base box let us know below in the comments section!
