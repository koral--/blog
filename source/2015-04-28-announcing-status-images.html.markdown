---
title: Announcing status images
date: 2015-04-28 14:01 UTC
tags: announcement
authors: Barnabas Birmacher|birmacher@bitrise.io
---

Status images have finally arrived to Bitrise!
From now on you can embed your project's status image to your project's README file,
documentation or wherever you want and show it to your visitors.

Here is our [Dev Center's](http://devcenter.bitrise.io) status ( hope it's green when you read this:) )

[![Build Status](https://www.bitrise.io/app/83acac4fa8a7643e.svg?token=KlXUQom3675zIXd5K2xf7w&branch=master)](http://devcenter.bitrise.io)

> To get the embed code for your app's status image you just have to
> click on the status image on [bitrise.io](https://www.bitrise.io).
> In the popup you can also specify which branch's status the
> badge / status image should show.

Currently we only support private apps on Bitrise so security was a huge issue when we
integrated [this user request](https://bitrise.uservoice.com/forums/235233-general/suggestions/7678128-add-image-endpoints-for-github-build-passing-faili){:target="_blank"}
into our service. You already have an API token that you can use to start builds
manually or through the [Bitrise Build Trigger API](http://devcenter.bitrise.io/api/build-trigger){:target="_blank"}.
Using the same API token would be a big risk if you plan to include your badge image in a public environment.

Therefore we created a new **read-only** token just for interacting with the status image,
so you can show it anywhere and still have your project in full safety.

You can find the embedding codes in your project's page.
Grab it, add it to wherever you want to and once it's public shoot us a tweet to get some free stickers!
