---
title: Multi Provisioning Profile support
date: 2015-01-24 14:24 UTC
tags: announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

We're happy to announce that you can now upload multiple
Provisioning Profiles for your app.

With this you can **build apps with extensions** as
extension targets require a separate bundle id
and so a separate Provisioning Profile for that target.

So far you could build your app with a *wildcard development
Provisioning Profile* which allows the same file
to be used for multiple, different bundle ids
but you could not build an app with a Distribution
Provisioning Profile where wildcard bundle id
is not an option.


## How you can set and use multiple Provisioning Profiles?

You can upload your Provisioning Profiles on the **Settings tab**
of your app, just like before.
But from now on you can upload as many profile files as you
need.

If you upload more than one Provisioning Profile
then the related `$BITRISE_PROVISION_URL` build
environment will contain all the Provisioning Profile URLs
separated with a pipe (`|`) character.

The Xcode build steps were updated to support
the handling of the new, multiple Provisioning Profile urls
environment variable.


## An important note about Xcode steps

To use this new feature in your existing app you have to **upgrade
your Xcode build steps** to the latest **3.0.0** version!

If you register a new app it will automatically use
these latest Xcode steps.

> As always if you have any issues or suggestion
> you can [contact us](http://www.bitrise.io/contact?utm_source=blog&utm_medium=blog&utm_campaign=bitrise){:target="_blank"}
> or leave a comment below,
> we're happy to help
> and to discuss about Bitrise.