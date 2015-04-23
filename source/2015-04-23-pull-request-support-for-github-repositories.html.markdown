---
title: Pull Request support for GitHub repositories
date: 2015-04-23 15:35 UTC
tags: announcement
authors: Barnabas Birmacher|birmacher@bitrise.io
---

We are happy to announce the support of the [GitHub Commit and Pull Request Status API](https://github.com/blog/1227-commit-status-api).

![Pull Request statuses](build_status.png)

As always if you are working on your project and push a commit, Bitrise will automatically detect it and start the build process.

From now on if you are using a [GitHub](https://github.com) repository we are going to send the build's status to [GitHub](https://github.com), so you can see it
directly in your GitHub repository, without visiting [Bitrise](https://www.bitrise.io/).

Furthermore if you create a Pull Request we won't just test the fork or the feature branch, Bitrise will test the actual merged code too. We will also run new builds for new commits added to the Pull Request and update it's status automatically.

From now on you can confidently merge your Pull Requests with green builds.

## I want it now!

We have some good news for you! We've already released this feature so you just have to make sure it's turned on for your App on Bitrise. To check whether it's turned on (and whether it can be)
go to your app's *Settings tab* and check the new **Pull Requests** section,
right under the *Default Branch* option.

You can find a step-by-step setup and migration guide on our
UserVoice site, at the related [feature request](https://bitrise.uservoice.com/forums/235233-general/suggestions/7206630-add-github-integration-for-pull-requests). *Note: for new projects registered on
Bitrise we automatically enable this feature (in case all the requirements are met).*

Please note that we are still improving this feature
so if you find any issue just [let us know](https://www.bitrise.io/contact)!
