---
title: Bitrise App Deployment update
date: 2015-02-27 16:24 UTC
tags: announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

As we mentioned in our [previous post](2015/02/20/first-version-of-bitrise-integrated-ios-app-deploy.html) we're still working on a couple of new features
for our integrated App Deployment system.

We discussed a lot about how the deployment system
should work to provide you an easy to use solution with the level
of customization you expect on Bitrise.

This week we finished two important new features:

1. Public install page for your App
2. (Automatic) notifications for your testers

If you enable the *Public install page* option
for an app version (on the version's Build page)
you'll get a long, random URL you can send to anyone
and they can visit this page even if they don't have
a Bitrise account.

You can also send install invite emails through Bitrise,
from the same place: the app version's build page.

We updated our deployment step too. With the latest
version (*1.1.0*) you can define the list of
testers who should receive an email notification
about the new app version
and whether the *Public install page*
should be enabled.

With these new features you can now automate
a continuous deployment workflow like this:

1. Work on your App's code and with the Workflow system define on what branch you would like an automatic app deployment (usually you want this for your *master* branch).
2. Whenever you push code to a branch which is configured for Bitrise App Deployment you'll be able to see and install the built app version right from the Build's page.
3. Invite your testers into your Bitrise App's team, this way you can configure automatic notifications which will be sent in email every time a new version of your app is built on Bitrise.
4. If you have other testers or a client you want to share stable versions with you can just go to the Build's page and invite as many additional testers as you like.

Check out our [DevCenter](http://devcenter.bitrise.io/tutorials/deploy/bitrise-app-deployment/){:target="_blank"} if you want to know all the details of
the deployment system and for a guide on
how you can configure automatic App deployments.


## What's next

There's still a couple of things we want to add to the
App Deployment system. The most significant one
will be automatic device identifier (UDID) detection and
registration to provide a simple way for your testers
to link test devices with their Bitrise accounts.

We're still testing the new system and thinking about
possible refinements. We plan to deliver device identifier
detection as soon as possible but even after that we'll
keep looking for use cases where we could improve the
overall experience, to provide you the easiest
way to automate your App development process and to
help with the distribution of your App be it only for you,
for your internal tester/QA team or for your client
who pays for your work.



