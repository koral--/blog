---
title: "Trigger a build from Slack, now with custom environment variables!"
date: 2016-06-23 07:55 UTC
tags: announcement, features, changelog
authors: Viktor Benei|viktorbenei@bitrise.io
---

TL;DR; you can now include custom environment variables in your
Builds triggerd **from** Slack! This is possible thanks to [@nobre84](https://github.com/nobre84),
who implemented this feature and sent us the [pull request](https://github.com/bitrise-io/bitrise-webhooks/pull/4) 🚀

A very short technical summary about how triggering a build through webhooks works:
**[bitrise.io](https://www.bitrise.io/) only supports our [Build Trigger API](http://devcenter.bitrise.io/api/build-trigger)**.
This API is used by the web interface when you start a build manually, as well as you can call it
via `curl` or from any other tool ([more info on our DevCenter](http://devcenter.bitrise.io/api/build-trigger)).

**So then how are webhooks handled?**

It's really simple. We use a "webhook transformer" server.
This server has a single purpose, it transforms service specific webhook calls (e.g.
GitHub, Bitbucket, Slack, VSTS, Gogs, ... webhook formats) to *Bitrise.io Build Trigger API*
calls, performs the call and then returns the response (build started / failed to start the build).

**The code of the server is [open source](https://github.com/bitrise-io/bitrise-webhooks)**, you can run it on
your own servers, change anything in the code and **send us a Pull Request** with your changes.
*We run the latest release version on [hooks.bitrise.io](http://hooks.bitrise.io/).*
This is how we now have Environment Variable parameter support for the Slack webhooks
(thanks to [@nobre84's Pull Request](https://github.com/bitrise-io/bitrise-webhooks/pull/4)),
as well as [Gogs](https://gogs.io/) service support
(thanks to [@crrobinson14's Pull Request](https://github.com/bitrise-io/bitrise-webhooks/pull/3))!


## How to use the new (Slack) Environment Variables option?

If you used Slack to trigger builds before then all you need to know is the format of
the environment variable parameter: `ENV[THE_ENV_KEY]: the env value`.

E.g. if you want to trigger a build on the **master** branch,
and you want to specify `IS_DEBUG=true` as an environment variable:

`/bitrise branch: master | ENV[IS_DEBUG]: true`

That's all! You can of course specify multiple env vars, just like you would
specify multiple parameters, separated by a pipe (`|`) character.

For more information about how you can configure a webhook for your Slack
channel (to be able to trigger builds from Slack),
and to see all the options you can use for triggering a build from Slack
[check out the related guide on GitHub](https://github.com/bitrise-io/bitrise-webhooks#slack---setup--usage).

Have fun, and Happy Building! 🚀
