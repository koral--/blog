---
title: First version of Bitrise integrated iOS App Deploy
date: 2015-02-20 16:37 UTC
tags: announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

The first version of our integrated iOS App Deploy
feature is finally available for all of you now.
It's still rough around the edges, there will be
a lot of improvements during the next week to make it
easier to setup and use it.

At the moment you have to manually get your device's
UDID and register it for your account (you can
do this on your [Account Settings page](https://www.bitrise.io/me/profile){:target="_blank"}) if you want to install your App directly from
Bitrise, we'll provide a more automated
solution, similar to how HockeyApp and Crashlytics
handles this.

The deployment is implemented with a Step (no one saw that coming),
just like our other deployment integrations (HockeyApp, Crashlytics, etc.).
We did not add the deployment Step to the default Workflow so far,
this means that even if you register a new App on Bitrise you'll have to opt-in
to start using this feature. Once we work out the remaining
user experience issues our plan is to enable the deployment
for every new registered App, providing a solid
iOS App archiving and deployment mechanism.

For your existing Apps you'll have to enable it manually if you
want to start using it, to not to interfere with your
ongoing projects at all. Fortunately, enabling the
Bitrise iOS App Deployment feature is really simple.


## How to enable (and disable) our integrated deployment feature?

To use the integrated deployment feature you have to
add our **Bitrise iOS App Deploy** Step to your
App's Workflow.. and that's all! Nothing else is required.
Similarly, if you want to disable the App Deployment you just have to
remove the Step from the Workflow.

Once you run a new build with your new Workflow configuration
including the Bitrise iOS App Deploy step you'll be able
to see the generated iOS App's details on the build's page,
download the App's .IPA file
and if you register your test devices for your account
you'll be able to install the App directly from the build's
page if you open it on your iOS device.

Next week we'll add a couple of additional features
like automatic sending of emails to your testers and
a publicly available URL (if you enable this) what
you can email to non Bitrise users.

Let us know what you think about the new feature
and send us your feedback if we missed something crucial
what you would use our deployment system for.

> As always if you have any issues or suggestion
> you can [contact us](http://www.bitrise.io/contact?utm_source=blog&utm_medium=blog&utm_campaign=bitrise){:target="_blank"}
> or leave a comment below,
> we're happy to help
> and to discuss about Bitrise.