---
title: Triggers on Bitrise
date: 2015-10-12 12:55 UTC
tags: features, announcement
authors: Tamas Bazsonyi|tamas.bazsonyi@bitrise.io
---
#Triggers on Bitrise

We admit, handling Workflows can be a bit hard especially when you use lots of feature branches. We created a Trigger Map to make things much more easier on [Bitrise](https://www.bitrise.io) and in our [Command Line Interface](https://github.com/bitrise-io/bitrise) too!

What is this Trigger Map? It's a mapping between `trigger expressions` and Workflows. Eg.: On [Bitrise](https://www.bitrise.io) the triggers are the name of the given branch and in our [Command Line Interface](https://github.com/bitrise-io/bitrise) the expression you set in `bitrise trigger <trigger_expression>`.

The `trigger expressions` can contain wildcard characters so it is possible to:
- Run the same Workflow for every Trigger
- Run the same Workflow for every branch that has the name `<expression>*`
- Or to run builds only for specific Triggers

You can read more about the Trigger Map at our [Devcenter](http://devcenter.bitrise.io/) in [Lesson 6 Pull the trigger on the Workflow](http://devcenter.bitrise.io/docs/lesson-6-pull-the-trigger-on-the-workflow)

Happy Building!
