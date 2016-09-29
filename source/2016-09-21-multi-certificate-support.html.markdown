---
title: Multi iOS Certificate (p12) support
date: 2016-09-21 12:24 UTC
tags: step-update, announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

Multiple iOS Certificate (p12 Identity file) support is finally here!!

___Important: Multi certificate is only supported in the latest `Certificate and profile installer`
step version (`1.7.0` or newer)! Previous versions of the step will fail
if you upload more than one certificate on [bitrise.io](https://www.bitrise.io),
so make sure that you update this step before you'd upload new p12 files!___

Why did it take so long for us to implement this?
It wasn't about the time it took to implement this feature, it was more about
guiding users in an efficient way through the Bitrise user experience.

__So, what changed?__

In the "Xcode 7 (and before) era" the most flexible code signing solutions
usually included the separation of available Certificates, that no more than
one Distribution certificate should have been available in the system during a specific build.
There were other concerns too, related to various "force code signing" setups.

On the other hand, with Xcode 8 and its new automatic code signing and "export options" based
code signing flow it doesn't matter anymore how many certificates are available in the system
during the build, and actually you might want to upload quite a few (for more details
see our previous blog post: [Xcode 8 and automatic code signing](/2016/09/21/xcode-8-and-automatic-code-signing.html))

Of course, if you prefer to have better control over which code signing files are available in
which workflow,
[you can still use the previous, Generic File Storage based solution](http://devcenter.bitrise.io/docs/upload-use-more-than-one-certificate-using-generic-file-storage),
but from now on you can decide which one you prefer ;)

Happy Building! 🚀
