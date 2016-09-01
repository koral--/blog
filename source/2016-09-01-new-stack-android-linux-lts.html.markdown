---
title: New Stack - Android/Linux LTS
date: 2016-09-01 16:16 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---


__Notes__: We always try to keep our Android/Linux stack up to date, but there are cases
[when you simply can't use the latest tools](https://github.com/facebook/react-native/issues/7430#issuecomment-217520969),
due to project or tool restrictions.

When we switched to Ubuntu 16 for the Android/Linux stack we got a couple of complaints
about breaking change, so, for a while, we kept the previous stack as a "temporary" stack.

After a while we had to realize that we won't be able to remove the older configuration
for quite some time, so we had to figure out a way to provide proper support
for the older stack too, so that the older stack can get the latest Bitrise CLI
tools or other critical updates.

The new `Android & Docker, on Ubuntu 14.04 - LTS Stack` stack provides exactly this.
The pre-cached `android-ndk` docker image on it is pinned to an older version
of the primary image, where the preinstalled Android NDK version was `r10e-rc4 (64-bit)`,
and it builds a very thing layer over that image,
which [installs the latest Bitrise CLI tools](https://github.com/bitrise-docker/android-ndk-lts/blob/master/Dockerfile),
but does not change anything else.

During the process of automating the creation of this LTS stack we wanted to
do a revision of __how we create all of our Docker images__. The result
was the introduction of the new "alpha" docker image, available for
every existing Docker image we had.

The weekly schedule and automation looks like this:

- we build a new "alpha" docker image __every day__, and run tests on them
- at the end of the week we do a full test on the latest "alpha" image
- then we declare that as a "stable" / "pin ready" image
- on Saturday we start a new process which publishes the latest "pinned" images as the "stable" ones
- then we create a new Virtual Machine image, where these latest stable images are pre-cached
- and finally, we replace the previous week's Virtual Machine with the new one,
  which now includes the latest "stable" docker images pre-cached

Of course, all of the scripts we use for buidling the Docker images are available on
our [github.com/bitrise-docker GitHub organization](https://github.com/bitrise-docker),
and the published Docker images on [Docker Hub](https://hub.docker.com/r/bitriseio/).
This means that [you can download and use these images to debug your build in the same environment it will run on Bitrise.io](/2016/08/08/debug-your-android-linux-builds-locally-with-docker.html)!


__To select this Stack__ you just have to **open your app** on [bitrise.io](https://www.bitrise.io),
go to the `Settings` tab, and at the bottom of the Settings tab select the `Android & Docker, on Ubuntu 14.04 - LTS Stack`
stack option, and your next build will start on the Ubuntu 14 stack.

__You can find the Stack's__ full __system report__ at:
[https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log).


**Happy Building!** 🚀
