---
title: Let's move to the new stack
date: 2016-02-04 09:27 UTC
tags: announcement, status
authors: Agnes Vasarhelyi|agnes@bitrise.io
---

We [introduced our new stack beta](http://blog.bitrise.io/2016/01/20/here-comes-the-new-stack.html) two weeks ago. It turned out to be a great improvement and we have a lot of people opted-in already. They are building happier then ever, so it's time to move y'all. 🚚

##The new stack

The OS X machines hosting your beloved apps will have pre-installed Xcode on them. The available setups will be listed **under your App's Settings tab**, called `NEW Stack selector`. It's a great thing, because we could eliminate some complexity caused by the now deprecated [Xcode select step](https://github.com/bitrise-io/steps-select-xcode-version) and we could also speed up things for you. The machines will be delivered to you [pre-booted or on-demand](http://devcenter.bitrise.io/infrastructure/available-stacks/#section-stack-prepare-types), depending on your stack selection and availability.

Another great thing about the new stack that we can now add pre-installed tools for any desired setup. It means if you'd like to have your [favorite dependency manager pre-installed](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3-beta.log#L34) on every machine with Xcode 7.3 beta for example, you can just send a PR to the [OS X bootstrapper](https://github.com/bitrise-io/osx-box-bootstrap#request-a-tool-to-be-pre-installed) and make it yours.

##Transition

>We are going to move all of you to the new stack **this Saturday, February 6**. It will come *without* any downtime, you will probably not experience anything special.

If you are using an OS X machine with Xcode 7.2 currently for example, you will have Xcode 7.2.1 after the transition. Any other setup stays the same (Xcode 6.4 will stay Xcode 6.4, etc.). You will be able to opt-out from the new stack until the end of this February. If you have any issues you can tie to this transition though, please contact us on [Slack](http://chat.bitrise.io/) or drop an [email to support](https://www.bitrise.io/contact), we are here to help.

Cheers and happy building on our shiny new machines! 🍷
