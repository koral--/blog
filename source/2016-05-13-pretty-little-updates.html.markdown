---
title: Pretty little updates ✨
date: 2016-05-13 12:20 UTC
tags: features
authors: Norbert Kovach|norbert.kovach@bitrise.io
---

<iframe src="//giphy.com/embed/evRN1g9M8xXi0?hideSocial=true" width="100%" height="264" frameborder="0" class="giphy-embed" allowfullscreen=""></iframe>


We'd like to highlight some tiny, but thoughtful improvements on Bitrise which we developed during the past weeks. While preparing some of our major features for release we always make sure to look in all nooks and crannies to see if something could use polishing.

##Test drive with just a few clicks for all platforms 🚗

Firstly, some good news for those who are just getting started with Bitrise. Two more sample app types (Android and Xamarin) are available for them! 🎉 With these adding a new project on Bitrise is just a few clicks and you can instantly discover the wonders and simplicity of tweaking your workflow.

##Who needs calculus?

Displaying build duration has changed - for the better! We decided that it would be easier to show the duration time in minutes and seconds instead of only seconds, because you need your brain more for fixing that annoying bug and not converting units. 🤓

##Some spring cleaning around workflows 🌷

In the workflow editor inside the step details the toggle for replacing environment variables is not available anymore. The status of each environment variable replacing is still shown, but to change it, you need to head over to the YAML editor. You can find out more about the how [in this guide](http://devcenter.bitrise.io/getting-started/manage-your-bitrise-workflow/#environment-variable-replace-mode).

Also in the workflow editor in the header of step details you can see a purple or an orange information notice. This tells you whether that particular step is maintained by us or not, so if it's us, you can be sure that it's 100% verified and organic. Feel free to contact us if you have any questions or feedback about them!

##Tidier team management 👨‍👩‍👧‍👦

If your invitee forgot to accept their invitation mail or just accidentally deleted it, there's no need to hold a grudge anymore. You don't have to remove them from the team member list, then type their e-mail address and then press "add" anymore. This was annoying, typing stuff more than once is lame. 💥 Forget it!

Now all it takes is two clicks to resend your invitation email.

Setting the connected git service user just became handier, too. When transferring the ownership of your app, you can now use a checkbox to decide whether you want to stay connected to that project with your git account, or it should be under the new owner's name. By default it's set to stay on the original owner, but it can be changed by switching to the "Always the owner" option.

##A turbo charger prototype for your builds ⚡️

The largest improvement is the first peek into a completely new feature, which is managing build caches. Navigate to your app's settings tab, click on the "Manage" button, and lo and behold: there's a popup to download or even delete cached items.
It is available only for Owners and Admins, all others should keep their pesky paws off your precious build cache.
You can read more extensively about [caching your builds here](http://devcenter.bitrise.io/caching/about-caching/).
