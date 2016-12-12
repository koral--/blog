---
title: Bitbucket pull request support is here! 😱
date: 2016-10-06 12:03 UTC
tags: features, announcement
authors: Barnabas Birmacher|birmacher@bitrise.io
---
It was long overdue to introduce pull request support for Bitbucket users, however we had to make a couple of changes to make it as easy as possible.
Supporting pull requests for GitHub was piece of 🍰. GitHub simply creates a new merge branch for every pull request that we can fetch and checkout. You can use this logic for pull requests coming from the same repository or from fork repositories.
Bitbucket unfortunately doesn't have this nice feature, instead you have to merge as you would do locally. This gets a bit tricky when the pull request is coming from a private fork. This way you need to have access for the private fork as well, otherwise the generic solution would simply fail.

We tried to find a solution where users don't have to setup multiple SSH keys to make this happen, and finally we can say that we've tracked it down! 🙌
Bitbucket also has a REST API, where they are exposing the diff files between pull requests, so if you have OAuth access enabled for Bitbucket, we can simply download this diff file and apply it to your destination branch. This will give you the merged changes for each build.

> **Important:** OAuth handling happens on Bitrise, so we won't expose your OAuth token during builds!

With these changes we've introduced new ways to merge pull requests. Now if the service supports merge branches or diff files we will use them, otherwise we will fall back to the normal, generic way. This also means, that you will see a couple of new services supported pretty soon!

> **To enable it for an existing project** [please follow this guide](https://bitrise-io.github.io/devcenter/webhooks/adding-a-bitbucket-webhook/), however if you add a new app, we will do this for you automatically! 👍

If you want to collect good karma and interested in helping us adding new services, [please head this way >](https://github.com/bitrise-io/bitrise-webhooks). ❤️
