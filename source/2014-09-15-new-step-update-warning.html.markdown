---
title: New step update alerts
date: 2014-09-15 20:58 UTC
tags: announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

We've added new warnings when a new version of a Step is available.

Previously the only step update warning message was the one in your Workflow
right under the Step.

In most of the cases once you set up your Workflow you won't check it frequently.
From time to time we have to introduce changes which might break existing steps.

We try to minimize these breaking changes as much as we can but given
the nature of software development things get old, sometimes really quickly.

Recently for example [we changed the default Xcode version](/2014/09/15/new-box-with-xcode-6.html)
in our VMs because the first non beta version of Xcode 6 was released.

When we introduce a breaking change we update our steps to support the new
environment the steps run in. The step upgrade in most cases [takes only a few clicks](http://devcenter.bitrise.io/getting-started/manage-your-bitrise-workflow/){:target="_blank"},
but you have to know about these updates in the most efficient way.

We always announce the significant step version updates here on our blog
but we know that you might not follow it daily.

To help you get the version update notifications at the right time at the right place
we from now on present a *new version of this step is available* warning
message in two new places:

* on the Build's details page
* in the Build summary email we send to you

*The warning message is only presented in case the step failed*, so
when everything goes without issues we won't bother you with unnecessary
alerts.

Additionally we added a *News* section to the Dashboard page
featuring the latest announcements from our blog to keep you updated.

We hope that you'll find these additions helpful and that these will help you
building amazing apps with Bitrise.
