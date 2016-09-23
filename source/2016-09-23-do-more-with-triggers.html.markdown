---
title: Do more with triggers ⚡️
date: 2016-09-23 15:00 UTC
tags: features
authors: Daniel Balla|danielballa@bitrise.io
---

<iframe src="//giphy.com/embed/13mZoAYdXgAmNa" width="100%" height="360" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

To be able to fully automate your development cycle, specifying certain trigger events is crucial. That's why we've rebuilt trigger mapping from the ground up to give you more control over what to build and when.

##Trigger only for _____________ 🚀

We've separated the Push and Pull Request events, because they simply didn't belong together. They kinda hated each other. So from now on you can trigger events only for Pushes or Pull Requests, if you so choose. For example, this comes in handy when you don't want your builds to pile up for pushing to `feature/` branches, but you'd like to test when that feature is pulled into `develop`.
You can check out [more use cases](https://bitrise-io.github.io/devcenter/webhooks/trigger-map/#dont-start-two-builds-for-pull-requests-from-the-same-repository) on our DevCenter, handy stuff!

##Target & source branch for PRs 🎯

There's also another layer to this change. Previously you could only set a pattern for the source branch of Pull Requests. You can now specify the target and source branch to have an exact filter for an exact workflow. You can finally specify a filter for every pull request which targets your `master` branch!

##Shiny new interface ✨

We've redesigned the UI of the Triggers section to give you a better overview of your options, and frankly, because the previous version was a bit confusing and hard to work with. Fully refurbished with new colors, sections, drag & drop option and simple adding/editing.

You can read much more about the changes [on our Devcenter](https://bitrise-io.github.io/devcenter/webhooks/trigger-map/) with tips, tricks and typical use cases. We'll soon add trigger option for Tags as well, so keep an eye out for changes! 🏷
