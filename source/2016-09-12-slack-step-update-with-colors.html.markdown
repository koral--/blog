---
title: Slack step update, with colors!
date: 2016-09-12 17:13 UTC
tags: step-update, announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

Today we released an update (actually two) for our [Slack step](https://github.com/bitrise-io/steps-slack-message).
The new version brings two important changes/updates:

1. [Channel name is no longer required](https://github.com/bitrise-io/steps-slack-message/issues/4)
2. And the step was updated to use Slack's "Attachment" API, which allows a color to be specified for the message.

__We have to thank [@Bunk](https://github.com/Bunk)__ for the full Attachment API support;
the [first version we released](https://github.com/bitrise-io/steps-slack-message/releases/tag/2.2.0) had this note:

> It can also use Slack's "Attachment" API feature to send the message,
> which allows a border color to be defined for the message but does not allow the regular text formatting (e.g. `*bold*`).

When we implemented the Attachment API call we somehow missed (to be fair, it's a bit hidden in the Slack API docs),
that Markdown formatting can be enabled for the Attachment text too,
you just have to enable it with `"mrkdwn_in": ["text", "pretext"]`,
as mentioned [in the Slack Message Formatting API docs](https://api.slack.com/docs/message-formatting),
in the "Message Formatting" section.
[@Bunk](https://github.com/Bunk) quickly pointed this out for us after the first
version was released, so we could release a second version which now has
markdown formatting enabled for the (attachment) text.

The new Slack step version also utilizes two new features which will be part
of tomorrow's Bitrise CLI release:

1. Better dependency (`deps`) management on Linux, as it provides both the package name (`golang`)
  and the binary name (`bin_name` : `go`) for checking whether the required dependency (Go)
  is installed.
2. It can be run with the CLI's new, built in Go Toolkit system.

We'll share more information about the Go Toolkit, and about Toolkits in the CLI,
in tomorrow's CLI release notes, TL;DR; is: if a step utilizes a Toolkit
it does not have to provide a bash entry file (`step.sh`) anymore.
__The Slack step is the first one which will be able to run on a system where Bash is not available!__

Using the toolkit can also provide performance benefits, as it does automatic binary
caching - which means that a given version of the Slack step will only be compiled
the first time, subsequent execution of the same version will use the compiled
binary of the step!

More about these, and even more, tomorrow 😉

**Happy Building!** 🚀
