---
title: "Step Update: Amazon S3 Deploy"
date: 2014-09-08 17:22 UTC
tags: step-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

Now that we had a little time to make some revisions in our system we went through our existing Steps, testing their performance.

Our Amazon S3 Deploy Step was one of the first Steps we developed for [Bitrise](https://www.bitrise.io){:target="_blank"}. We worked mostly with Ruby, we used S3's Ruby SDK in other projects so we choose to do a Ruby Gem based solution.

After a few tests we found that the initialization was painfully slow. So slow that in most of the cases the initialization took more time than the actual deployment of the files!

The AWS Gem installs a huge amount of dependencies, some even requires native extensions to be compiled.

We already used [s3cmd](http://s3tools.org/s3cmd){:target="_blank"} in our [S3 Upload Step](https://github.com/bitrise-io/steps-amazon-s3-upload){:target="_blank"} and it works really well.

The installation of s3cmd through [Homebrew](http://brew.sh/){:target="_blank"} takes less than 5 seconds. That’s roughly a **85 seconds speed up**.

Our minimal test project’s deployment workflow took about 150 seconds with the previous version of the Step and it now takes about 30-40 seconds with the new version. That's **more than a 70% improvement** over the previous version!

We’ll continue refining our Steps so you can build and deploy your apps more efficiently. We believe that you should only deal with the things what really matter. Bitrise will handle the rest.

*All of our Steps are open source and you can find them on [GitHub](https://github.com/bitrise-io){:target="_blank"}.*

*Link to the Amazon S3 Deploy Step's [source code](https://github.com/bitrise-io/steps-amazon-s3-deploy){:target="_blank"}*

> If you need help with updating the version of your Steps check out our [DevCenter](http://devcenter.bitrise.io/getting-started/manage-your-bitrise-workflow/){:target="_blank"} or leave a comment below.

> If you have problems with the new version of the Step contact us at **letsconnect at bitrise io** or leave a comment below.
