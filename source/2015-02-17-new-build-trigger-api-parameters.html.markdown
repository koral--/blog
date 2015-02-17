---
title: New Build Trigger API parameters
date: 2015-02-17 09:45 UTC
tags: announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

You might have seen the `Code tab` when you opened your
App's page on Bitrise but probably only a few of you have
used it before.

We introduced the Code tab while we were working on the
site revisions at the end of last year and designed it to
be your go-to place if you want to integrate your
App's building with other tools.

We're working on other APIs so that you can get the state
of your App and to get information about the builds
but probably the most important thing you want to automate
and have full control over is starting builds. This
API is already available and we even include an
interactive cURL API call configurator at the end of your
App's `Code` tab.

We're glad to announce that lately **we extended our API
and also the cURL configurator web UI with two new
configuration options** which provide you even more
control over your builds than what you had before.

## Workflow selection

With the first new option you can now **specify directly
which Workflow should be used** for the build.
By default Bitrise selects the Workflow for the build
based on the *branch* parameter but from now on
you can override the automatic selection and
select any of the App's Workflows through
the Build Trigger API.

## Environment Variables

The second option was requested by Bitrise users
and so we're really excited to announce that
you can now **configure custom Environment Variables**
through the Build Trigger API. The variables
you specify this way are handled with the highest
priority except a Step's own inputs,
so you can even overwrite or use other
environment variables of your Workflow.

For example you can include your *App's
title* in your custom environment variable
by inserting `$BITRISE_APP_TITLE` into the value
of your custom environment variable (make sure
that the *Replace variables in input?* option is enabled
for your environment variable).

We hope that with these new build parameters
you'll be able to customize your builds the way you
want to, and even easier than you could before.

> As always if you have any issues or suggestion
> you can [contact us](http://www.bitrise.io/contact?utm_source=blog&utm_medium=blog&utm_campaign=bitrise){:target="_blank"}
> or leave a comment below,
> we're happy to help
> and to discuss about Bitrise.
