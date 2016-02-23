---
title: All the webhooks you need
date: 2016-02-23 14:30 UTC
tags: announcement
authors: Agnes Vasarhelyi|agnes@bitrise.io
---

If you already have webhooks set up for your apps on Bitrise and you are happy with them, you still might be interested in how generalizing our webhook processing logic can make your life better.

## What's new?

The [new webhook processor](https://github.com/bitrise-io/bitrise-webhooks) supports new providers, now it's possible to set up not just [GitHub](https://github.com/), [Bitbucket](https://bitbucket.org/), but [Visual Studio Online](https://www.visualstudio.com/products/visual-studio-team-services-vs) and [GitLab](https://gitlab.com/) webhooks as well. It's not even the end of the story, because all the logic has been [open sourced](https://github.com/bitrise-io/bitrise-webhooks) and exposed to a separate service.

The point of this update was to make it possible to connect *any kind of* webhooks and map them to our build trigger API. That's how delightful features like [starting your build with a Slack message](https://github.com/bitrise-io/bitrise-webhooks#slack---setup--usage) could born. The number of possibilities are close to infinite, but we tried to figure out what's the most important for you. Read on to check out the list of currently supported services.

> We also introduced API tokens to the webhook URLs. It means that the v1 requests missing the token are now deprecated. The new format is `../h/{provider}/BITRISE-APP-SLUG/BITRISE-APP-API-TOKEN`. Read more about this in the [webhooks GitHub repo](https://github.com/bitrise-io/bitrise-webhooks).

### Supported services

If you'd like to set up a new webhook for your already existing app right away, go to your app's **Code** tab and check the `Webhook` section for auto-generated webhook URLs after selecting the desired service.

#### GitHub

It's been there already and it stays still. One thing has changed: now you are able to [see the code](https://github.com/bitrise-io/bitrise-webhooks/blob/master/service/hook/github/github.go) behind it.

#### Bitbucket v2

Bitbucket has been already supported, check the [docs on GitHub for setup](https://github.com/bitrise-io/bitrise-webhooks#bitbucket-v2-webhooks---setup--usage) instructions.

#### Visual Studio Online

It's a new addition, for people using Xamarin and having their code hosted on VSO. Check out how to set it up in the [related description](https://github.com/bitrise-io/bitrise-webhooks#visual-studio-online--visual-studio-team-services---setup--usage).

#### GitLab

It's our latest addition, check out [how to set up a Bitrise webhook for your GitLab repository](https://github.com/bitrise-io/bitrise-webhooks#gitlab---setup--usage).

#### Slack

That's something showing the real power of this change. You can set it up easily from your Slack account as an outgoing webhook, or a slash command, like `/bitrise branch: master`.  Read more about how to add it to your Bitrise app in the [webhooks Readme](https://github.com/bitrise-io/bitrise-webhooks#slack---setup--usage).

### Anything else?

The greatness of open source is not just about transparency, it's about letting people customize their workflows in their favor. We think that hosting technology is great, but giving the chance to integrate with any kind of service is priceless.

If you have something you'd use and we don't have its support implemented currently, you can [open an issue in the webhooks repo](https://github.com/bitrise-io/bitrise-webhooks/issues) anytime. If you feel the power, you can [send a pull request](https://github.com/bitrise-io/bitrise-webhooks/pulls) right away! Check out our [guide on how to add a new service](https://github.com/bitrise-io/bitrise-webhooks#how-to-add-support-for-a-new-provider) to the webhooks processor. If you have any questions, [join our public Slack](https://chat.bitrise.io), or tweet us [@bitrise](https://twitter.com/bitrise).
