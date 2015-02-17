---
title: Slack, HockeyApp and Amazon S3 step updates
date: 2015-01-26 16:44 UTC
tags: step-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

Recently we've updated a couple of core steps,
this is a brief summary of the more significant changes.


## Xcode build steps

The most important change is that **starting with version 3.0.0
the Xcode build steps can now handle Multiple Provisioning
Profiles**.

You can read more about how you can upload and use
more than one Provisioning Profile per app in our [previous blog post](/2015/01/24/multi-provisioning-profile-support.html){:target="_blank"}.

*You can find the Step's source code: [on GitHub](https://github.com/bitrise-io/steps-xcode-builder){:target="_blank"}*.


## Slack message step

The step now does a full JSON encode on the message,
you can now send any kind of complex text
to your Slack channel, decorate your status messages
the way you want to.

*You can find the Step's source code: [on GitHub](https://github.com/bitrise-io/steps-slack-message){:target="_blank"}*.


## HockeyApp deploy step

We fixed a couple of issues, updated the step's YML descriptor
with better descriptions and updated the step's formatted
output as well to produce more helpful quick view outputs.

*You can find the Step's source code: [on GitHub](https://github.com/bitrise-io/step-hockeyapp-deploy){:target="_blank"}*.


## Amazon S3 steps

Both of our Amazon S3 steps use the [s3cmd](http://s3tools.org/s3cmd){:target="_blank"} tool for communication with Amazon S3
and the latest s3cmd version (1.5.0) contains an OS X related
bug - it tries to use `python2` which is not available on
OS X by default. As a fix we now create a hard link to `/usr/bin/python2.7`
as `/usr/bin/python2` to make s3cmd functional on OS X.

*You can find both Steps' source code on GitHub: [Amazon S3 App deploy step](https://github.com/bitrise-io/steps-amazon-s3-deploy){:target="_blank"}; [Amazon S3 bucket sync step](https://github.com/bitrise-io/steps-amazon-s3-upload){:target="_blank"}*.

> As always if you have any issues or suggestion
> you can [contact us](http://www.bitrise.io/contact?utm_source=blog&utm_medium=blog&utm_campaign=bitrise){:target="_blank"}
> or leave a comment below,
> we're happy to help
> and to discuss about Bitrise.