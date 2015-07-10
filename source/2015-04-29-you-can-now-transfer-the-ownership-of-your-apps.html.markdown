---
title: You can now transfer the ownership of your apps
date: 2015-04-29 11:01 UTC
tags: announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

Recently we had a couple of requests to change the owner of an app
on [Bitrise.io](https://www.bitrise.io/). Doing this manually on production
servers / databases is a significant concern, so we decided to rather implement
this as a feature.

It is now available for everyone, integrated into the **Team tab** of
your apps.


## How does it work?

First you have to **ensure that the new owner**, who you want to transfer the
ownership of your app, **is already in the team of the app**.
You can check this on the App's **Team tab** on Bitrise.

Additionally the new owner have to be a *confirmed* user on Bitrise, which means
that he/she have to complete the registration process before the
ownership transfer could be started.

If these conditions are met then everything's set up for the ownership transfer.
All you have to do it:

1. The **current owner of the App** have to open the App's page on [Bitrise.io](https://www.bitrise.io/)
2. Go to the **Team** tab
3. Locate the team member who should be the new owner
4. Click on the **change role** button
5. In the popup click on the *Click here to transfer the ownership of this app to NEW-USER.* option
6. Confirm the transfer

Once it's done you (the previous owner) will be still part of the App's team,
but as a regular *admin* member. The new owner will be responsible for
managing the payments in the future, and of course he/she'll be the one
who can delete the app if needed.
