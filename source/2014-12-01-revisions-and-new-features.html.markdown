---
title: Revisions and new features
date: 2014-12-01 11:05 UTC
tags: announcement, step-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

## User experience and design revision

As we mentioned in our previous blog posts we're working on
a large scale user experience and design revision.

The first round of the new design went live during the weekend
and is now available on:

* the Dashboard
* Apps list page
* Activity list page
* Build details page
* App pages (builds, team and settings tabs), except the Workflow tab

We plan to finish the revision of the remaining pages during
this week and hopefully next week you'll be presented with
the new design on every page.

> We're eager to hear your [feedback](https://www.bitrise.io/contact){:target="_blank"}!
> The new design will be tweaked in the coming weeks
> and we plan to align our other sub-sites' (Blog and DevCenter) design
> to better match the new style.


## [User Requested] New default build environments you can use in the Steps

We had multiple user requests for a **Build Number** environment
you can use in the Steps of your Workflow.

Before this you could access the App's slug (hash ID) and
the Build's slug but a numerical, incremented build number
is a great addition for deploy folder structuring if
you deploy to Amazon S3, FTP or other storage system
where you can define the hierarchy of the files.

*Note: we now have a **Dropbox deploy step** in beta
stage, it's available in the [Open StepLib collection](http://www.steplib.com/step/dropbox-upload){:target="_blank"}. It requires a few manual setup steps
which we plan to improve before adding it to the Bitrise step collection.*

We added another default environment variable, the Build's
trigger timestamp (timestamp of the initiation of the Build).

You can insert these environments in your steps' inputs:

* `$BITRISE_BUILD_NUMBER`
* `$BITRISE_BUILD_TRIGGER_TIMESTAMP`


## Step update: Environment Variable step

*Repository: [https://github.com/bitrise-io/steps-environment-variable](https://github.com/bitrise-io/steps-environment-variable){:target="_blank"}*

*Open StepLib page: [http://www.steplib.com/step/single-environment-variable](http://www.steplib.com/step/single-environment-variable){:target="_blank"}*

This step can be used to define your own custom environment variables
which then can be used in the steps of the workflow.

Previously it was a really simple step which missed a couple of
edge cases and it was lacking the formatted output support
so as a weekend project we made a complete revision,
making it more in line technically with our newer steps.

*This step is available in both the [Open StepLib](http://www.steplib.com/){:target="_blank"} and
in the [Bitrise step collection](https://github.com/bitrise-io/bitrise-step-collection){:target="_blank"}.*

> As usual if you have any issues or suggestion
> you can [contact us](https://www.bitrise.io/contact?utm_source=blog&utm_medium=blog&utm_campaign=bitrise){:target="_blank"}
> or leave a comment below,
> we're always happy to help
> and to discuss about Bitrise.
