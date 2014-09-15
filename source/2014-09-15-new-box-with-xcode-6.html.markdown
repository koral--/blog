---
title: New Box with Xcode 6
date: 2014-09-15 11:54 UTC
tags: box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

New base Boxes rolling out right now. From now on you can use both Xcode 5 and Xcode 6 for building your projects.

We've decided to set Xcode 6 as the default version because:

* in most of the cases it should be compatible with your Xcode 5 projects
* to submit an iOS 8 app to the App Store Apple recommends to use Xcode 6 (GM) and for apps written in Swift that's your only option (Swift projects can't be built with Xcode 5)
* by setting Xcode 6 as the default Xcode version for new app's verification (when you add a new app on Bitrise) you can now safely add Swift based apps

You can however upgrade your Xcode Steps (Build, Analyze, Archive, Unit Test) to the latest Step version which supports Xcode version selection.

If you want to keep building with Xcode 5 all you have to do is update your Step to the latest version and set **5** for the *(Optional) Xcode Version to use. Default is "6"* option.

For more information you can check our [Xcode support guideline on our DevCenter](http://devcenter.bitrise.io/docs/xcode-version-support.html).

> If you have any problem with the new base box let us know below in the comments section!
