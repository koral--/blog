---
title: Pull Request support for GitHub repositories
date: 2015-04-12 14:38 UTC
tags: announcement
authors: Barnabas Birmacher|birmacher@bitrise.io
---
We are happy to announce support for the [GitHub Status API](https://github.com/blog/1227-commit-status-api).

![Pull Request statuses](build_status.png)

As was always if you are working on your project and upload a commit, Bitrise will automatically detect it and start the build process. Additionally from now if you are using a [GitHub](https://github.com) repository we are going to send the build's status to [GitHub](https://github.com).

Furthermore if you are creating a Pull Request we won't just test the fork or the feature branch but the  merge version too. We will also re-run each workflow if any new commits are added to the Pull Requests.

From now on you can confidently merge your Pull Request with green builds.

## I want it now!
We have some good news for you! We've already released this feature so you just have to make sure it's turned on in your repository's settings page.

Please note that we are still improving it so if you find any issue just let us know!