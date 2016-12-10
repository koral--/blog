---
title: Here comes the new stack
date: 2016-01-20 11:27 UTC
tags: announcement
authors: Agnes Vasarhelyi|agnes@bitrise.io
---

Happy to introduce our new stack beta today, which is a small step for [Bitrise](https://bitrise.io), but a great upgrade for the developer kind.

> **TL;DR -** You can find the new stack selector under your app's settings.

It means that from now on, we will deliver a machine with only the desired Xcode version preinstalled to you. You can select from various setups, like an OS X 10.11 machine with Xcode 7.2, or Xcode 6.4 for example.

Until now you could [change your Xcode version](https://github.com/bitrise-io/steps-select-xcode-version) in your workflow as a separate build step. This possibility introduced a lot of unpleasant complexity to the infrastructure, so we decided to make it right. 👊

You can check out the [available environments to select on Bitrise Devcenter](http://devcenter.bitrise.io/infrastructure/available-stacks/#section-os-x), but the most important thing is that you always have the power to change them, just send a pull request to the [OS X bootstrapper](https://github.com/bitrise-io/osx-box-bootstrap#request-a-tool-to-be-pre-installed). It also generates a [system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log) for the given environment. If you miss anything from the report, you can find the URL of the script [in the first lines](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log#L2) and send a PR to extend it.

The environments are going to be [prepared as on-demand or pre-booted](http://devcenter.bitrise.io/infrastructure/available-stacks/#section-stack-prepare-types), which means you will have a blazing fast, pre-booted environment if it's available for the selected stack. If there's no more pre-booted machines are available, or the given stack doesn't support it, your virtual machine will be created and booted on demand.

The new setup also results less regular VM updates, since the updates will occur only when it's necessary for the selected environment. The possibility of breaking something with uninvited updates will be dramatically reduced. 😱

###Xcode 7.3 beta 🚀

Another lovely surprise is that Xcode 7.3 beta has arrived with the new stack, you can opt-in for using it. The default configuration for iOS will be Xcode 7.2.

###Transition

The transition happens next week, it's going to be opt-in until that. If you are on the setup of an OS X with Xcode 7.2 currently, you will have the exact same setup with the difference of upgrading your OS X from 10.10 to 10.11 after this change.

###Beta stack

For two weeks after the transition, you will be able to opt-out from the new beta stack. If you experience any problems during the switch, you will be able to debug the issues this way. After this period, all the machines with the old behavior will be wiped out. Ping us on [Twitter](https://twitter.com/bitrise) or [Slack](http://chat.bitrise.io/), or drop an [email to support](https://www.bitrise.io/contact) if we can be of any help.
