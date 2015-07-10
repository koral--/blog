---
title: Slack Step update and Fabric/Crashlytics deploy Step
date: 2015-02-06 09:50 UTC
tags: step-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

# Slack Step update

We once again updated the [Slack](https://slack.com/){:target="_blank"} Step.
The communication code
is completely rewritten, this time in [Go](https://golang.org/){:target="_blank"}
(this is our first Step which has a significant
portion of it written in Go).

We had encoding issues in the previous versions of the
Slack Step which we solved with running the message
through Ruby and generating proper JSON encoded message
for Slack. In the new version of the Step the whole
JSON serialization happens in the Go code which means
that every information it sends to Slack (username, channel, etc.)
is now properly encoded and escaped.

As part of the rewrite we did one more thing,
**the new Slack Step now supports the Slack icon parameter**,
you can either specify an *emoji* code (the same emoji code
you use on Slack, for example `:ghost:`) or a full URL
to be used as the sender icon.

We also created our [official Bitrise Slack icon](https://bitrise-public-content-production.s3.amazonaws.com/slack/bitrise-slack-icon-128.png){:target="_blank"}
and it's used by default if you add the Slack Step
to your Workflow from our Bitrise Verified Steps collection.


# Fabric/Crashlytics beta deploy [new]

It's a completely new Step which can be used as an alternative
to the (deprecated) TestFlight deploy step.

With this Step you can deploy to the Crashlytics beta service,
which is now part
of [Twitter's Fabric](https://get.fabric.io/){:target="_blank"} service.

To get started just follow the guide we included in the Step's
description. You'll have to register
a [Fabric account](https://get.fabric.io/){:target="_blank"}
and follow their app setup guide. Once your app is registered
on Fabric for beta OTA deployment you can just
drop our deployment Step into your Workflow (after an Xcode Archive step)
and it'll automatically upload your app versions
to the Fabric/Crashlytics deployment service.

It's a little bit more work to set up than it was with TestFlight
but we see more and more teams who started using the
Fabric/Crashlytics beta service and we wanted to provide
an easy to use solution to integrate it with Bitrise.

We're already working on our own OTA deployment solution
as we mentioned in the [TestFlightApp.com is shutting down at February 26th](/2015/01/28/testflightapp-com-is-shutting-down-at-february-26th.html)
post, hopefully you'll be able to start using it the
next week and we'll keep improving it to provide
a viable alternative if you don't need the more
advanced crash collection and statistics features
you can find on specialized services like Fabric/Crashlytics beta.

In case you need those features you can just use a Step for
that either from our or from the [Open Step Library](http://www.steplib.com/){:target="_blank"}'s
steps collection (like this new [Fabric/Crashlytics deploy Step](http://www.steplib.com/step/fabric-crashlytics-beta-deploy){:target="_blank"}) or
write your own - the StepLib project now has a complete step template
repository [on GitHub](https://github.com/steplib/step-template){:target="_blank"}
to make it super easy for you to get started
developing your Step and you can always [contact us](https://www.bitrise.io/contact?utm_source=blog&utm_medium=blog&utm_campaign=bitrise){:target="_blank"}
if you have a question or if you need help with your Step.



