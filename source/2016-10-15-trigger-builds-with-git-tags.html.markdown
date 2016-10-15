---
title: Trigger builds with Git Tags 🏷
date: 2016-10-15 10:50 UTC
tags: features
authors: Daniel Balla|danielballa@bitrise.io
---


We've recently [restructured the Bitrise trigger handling](http://blog.bitrise.io/2016/09/23/do-more-with-triggers.html) and added a couple of nice features, like trigger only for pull requests and specifying source and target branch for each PR.

Now we're taking it up a notch by adding tag support to triggers. This means that you can specify a pattern for your tags to trigger a specific workflow, like `release` or `deploy-to-prod`.

##Why you should use tags

![Build tags](build_tags.png)

Tags are a good way to build and deploy your app in a specific state, e.g. `v1.0.2`. Previously you couldn't ensure this, because only branch patterns were available, but tags give additional granularity to your setup.

###Right now you might have triggers like this with a standard GitFlow method:

<pre><code>trigger_map:
- push_branch: develop
  workflow: deploy-to-stage
- push_branch: master
  workflow: deploy-to-prod
- push_branch: "*"
  workflow: test
- pull_request_target_branch: "*"
  workflow: test
</code></pre>

###You can now swap out the push trigger for `master` to a tag trigger, which would look like this:

<pre><code>trigger_map:
- push_branch: develop
  workflow: deploy-to-stage
- tag: v*.*.*
  workflow: deploy-to-prod
- push_branch: "*"
  workflow: test
- pull_request_target_branch: "*"
  workflow: test
</code></pre>

For those of you, who'd rather click than type, this can be setup easily on the shiny, new UI, in which case, you'll notice a new option and an icon for tags. Builds triggered by your tags will also show up differently on your Builds page. Neat! ✨
