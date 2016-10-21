---
title: Trigger builds with Git Tags 🏷
date: 2016-10-15 10:50 UTC
tags: features
authors: Daniel Balla|danielballa@bitrise.io
---


We've recently [restructured the Bitrise trigger handling](http://blog.bitrise.io/2016/09/23/do-more-with-triggers.html) and
added a couple of nice features, like trigger only for pull requests and specifying source and target branch for each PR.

Now we're taking it up a notch by adding tag support to triggers.
This means that you can specify a pattern for your tags to trigger a specific workflow, like `release` or `deploy-to-prod`.

## Why you should use tags

![Build tags](build_tags.png)

Tags are a good way to build and deploy your app in a specific state, e.g. `v1.0.2`. Previously you couldn't ensure this, because only branch patterns were available, but tags give additional granularity to your setup.

### Right now you might have triggers like this with a standard GitFlow method:

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

### You can now swap out the push trigger for `master` to a tag trigger, which would look like this:

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

For those of you, who'd rather click than type, this can be setup easily on the shiny, new UI,
in which case, you'll notice a new option and an icon for tags. Builds triggered by your tags will also show up differently on your Builds page.
Neat! ✨


## Update your webhook URL if it's the old bitrise.io/hooks one!

__New trigger feature__ (like [skip ci](https://bitrise-io.github.io/devcenter/tips-and-tricks/skip-a-build/) or tag based triggering)
__are only available if you use the new hooks.bitrise.io webhook URL!__

Initially we had a non open source `bitrise.io/hooks` endpoint for webhooks,
but every new project registered should now get the new `hooks.bitrise.io` webhook URL automatically.

__If your webhook would still be a `bitrise.io/hooks` URL, please replace it with the new `hooks.bitrise.io/` URL - you can find this on the `Code` tab of your app!__


## Couple of service specific notes

### GitHub

You don't have to change anything to get Tag trigger support for your GitHub repository, it just works.
The only thing you should be aware of is that __if you `git push --tags` more than 3 tags
at the same time GitHub will not send any tag push webhook__! If you push one, two or three new
tags with `git push --tags` GitHub will send all tags separately and will start separate builds,
but if you try to push more than three tags it won't send any webhooks, and so no build will be triggered
for the tags.

### Bitbucket

There's nothing you would have to change if you already have a Bitbucket webhook registered
for your [bitrise.io](https://www.bitrise.io) app, it just works. Every tag triggers a new build, even if you push more than
one new tags with `git push --tags` all new tags will trigger a build.

### GitLab

__If you previously added a webhook on GitLab and forgot to enable the `Tag Push event`, you'll have to
delete the webhook and add it again__, as GitLab doesn't have an edit feature for webhooks.
If you need help with adding the webhook manually with the Tag Push event enabled,
please [follow this setup guide](https://github.com/bitrise-io/bitrise-webhooks#gitlab---setup--usage).

### Visual Studio Team Services / Visual Studio Online

No webhook change required, but __don't push more than one tag at a time__.
The webhook behaviour of VSTS is quite inconsistent if you push more than
one tag with `git push --tags`, usually at least one tag webhook is not delieverd.
