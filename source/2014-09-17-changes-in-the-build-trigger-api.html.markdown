---
title: Changes in the Build Trigger API
date: 2014-09-17 09:49 UTC
tags: announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

With Bitrise's Build Trigger API you can start a new build of your app
with a simple API call.

You can define parameters for the build like what branch or tag to use
and what build message to present on the Build's details page.

With the Build Trigger API you can integrate your app's building
with your other services.

The old API required two information to decide whether the caller is
verified to start the build or not: the app's id on Bitrise
and the app's repository url.

The main problem with this is that both information is hard to change,
once you register your app on Bitrise you can't change the app's id
and you most certainly don't want to change your repository url unless you
really have to.

To solve this problem from now on every app on Bitrise has an API Token
which is required to start a build through the Build Trigger API.

You can find your app's API Token on the Settings tab of the app
and you can generate a new token whenever you want to.

To help you testing your build triggers we've included a configurator
on the Settings tab of your apps under the *Build Trigger API* section.

For more information check out
our [DevCenter](http://devcenter.bitrise.io/api/build-trigger).
