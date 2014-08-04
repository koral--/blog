---
title: Step Updates
date: 2014-08-04 19:48 UTC
tags: step-update
authors: Viktor Benei|viktor.benei@gmail.com
---

We've added Formatted Output support for three deploy Steps:

* Amazons S3 Deploy [github](https://github.com/bitrise-io/steps-amazon-s3-deploy)
* TestFlight Deploy [github](https://github.com/bitrise-io/step-testflight-deploy)
* Amazon S3 Upload / Bucket sync [github](https://github.com/bitrise-io/steps-amazon-s3-upload)

Formatted Output will help you get to the related deploy easier.

For example the TestFlight step's output contains two links:

* The Install URL -> opening this link on an iOS device you can download and install the app immediately.
* The Configuration URL -> with this you can set the permissions of the build.

With these additions you can manage your deploys easier and quicker than before.
