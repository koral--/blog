---
title: Xamarin - ProGuard issue and fix
date: 2016-09-05 16:34 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

If you have __ProGuard enabled__ in your Xamarin (Stable) Android build,
and you get an error like:

<pre><code>java.io.IOException: Can't read [/Users/vagrant/Library/Developer/Xamarin/android-sdk-macosx/platforms/android-24/android.jar] (Can't process class [dalvik/annotation/TestTargetClass.class] (Unsupported class version number [52.0] (maximum 51.0, Java 1.7)))
</code></pre>

This is caused by a known Xamarin Stable issue, which happens if the Android 24 packages
are installed.
Fortunately the fix is quite simple, just add a `Script` step to your
workflow (can be the very first step in your workflow) with the content:

<pre><code>#!/bin/bash
set -ex

cd $ANDROID_HOME 
rm -rf build-tools/24.0.*
rm -rf platforms/android-24/
</code></pre>

This will remove the Android 24 platform and the related build tools.
After this your build will work again.

**Happy Building!** 🚀
