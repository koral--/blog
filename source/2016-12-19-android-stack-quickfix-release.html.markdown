---
title: Android stack quickfix release
date: 2016-12-19 21:02 UTC
tags: announcement, status, box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

A quickfix stack update was released for the Linux/Android stack,
to fix the Android Emulator issue:
`error while loading shared libraries: libQt5Widgets.so.5: cannot open shared object file: No such file or directory`

For more information see [bitrise-io/build.issues/issues/39](https://github.com/bitrise-io/build.issues/issues/39).

We added a related test project to our "stack update" test projects collection
(which we run on the upcoming stack updates before releasing the update),
to ensure that no new Android/Linux stack will be deployed where the Android Emulator
can't be loaded (using our Start & Create Android Emulator steps).

_You can find the
[system report diff here](https://github.com/bitrise-io/bitrise.io/pull/107/commits/e2b4bd6a12bc8bc15a2880127df8f8a51b9bc221)._
