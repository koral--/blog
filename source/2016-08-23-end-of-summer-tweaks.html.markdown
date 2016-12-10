---
title: End of summer tweaks
date: 2016-08-23 13:16 UTC
tags: features
authors: Norbert Kovach|norbert.kovach@bitrise.io
---

Here are a few small but useful tweaks and polishes we've done recently to make your experience on Bitrise even better. Some you might have already seen, but read on to make sure you haven't missed a thing. 👇

##Helpful Stack icon popover 🎈

We've put a few more useful information in the popover for every Stack icon. Just hover over it and you'll see the Stack's exact name and a link to learn more about it. Neat-o!

##WorkflowID renaming

Renaming your workflow just became a bit more fun with a seamless point-and-click method. Now that nasty `rename` link won't take up precious pixels on your monitor. ✨

##New trigger pattern popup

You can now easily check the corresponding triggers for each workflow without having to navigate to the triggers tab. We've even added a button that takes you to a helpful guide about [setting up triggers](http://devcenter.bitrise.io/webhooks/trigger-map/), because we're nice like that. ⚡️

##Edit your scheduled builds 🕑

We know that you like to keep things tidy and organized, so many of you are zealously scheduling builds. Nothing feels better than a fresh, crispy build in the morning. But at the same time, nothing is more annoying, when you can't edit your scheduled builds, so now you can. It works as expected, the same way as creating a new one. Go enjoy being productive!

##More info about builds at a glance

You can now see a bit more info about each build on the Builds page, like the workflow name and commit hash. On top of that, you can now make cool and trendy commit messages by adding markdown text. 🌈

##View HTML artifacts inline 👀

Yup, exactly as the title says. Whenever an HTML artifact is generated, you can click on the eye icon to view it inline, no need to download and open it. Less clicks, more delight.

![Build Artifact HTML viewer example](build_artifact_html_viewer_example.png)

##Add new app tweaks

Being able to add new apps to Bitrise is a core part of your experience, so we're always looking for ways to make the flow better.

You can now see the avatar of your GitHub/Bitbucket account or team when selecting a repository, because avatars make everything better. Except maybe in that movie. 🙅
If you choose to add a repo manually, and you happen to paste an HTTP(S) clone URL, you'll receive a friendly reminder, that no matter how much we want, we can't use SSH for authentication. Sorry.

![Add new app HTTP(S) Friendly reminder](https_friendly_reminder.png)

###SSH setup 🔓

We completely overhauled the SSH setup section as well, because we deemed it confusing. Simply too many options were displayed. Now you'll see an easy question, with two possible, similarly easy answers. Shouldn't be a problem!

###Validation 🕵

The `Validation setup` where you can decide whether you want us to scan your project for a configuration just got a little facelift for better user experience.

The process of validation itself is now easier to digest on first glance. By default, we are only displaying one, active line of the log instead of overwhelming you with the whole stuff. At the same time, you can also see which step is running at that moment.
Of course you can still expand the whole log if you so choose.

![Add new app Validation Progress](add_new_app_validation_progress.png)
