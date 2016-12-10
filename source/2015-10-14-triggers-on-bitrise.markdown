---
title: Triggers on Bitrise
date: 2015-10-14 11:34 UTC
tags: features, announcement
authors: Tamas Bazsonyi|tamas.bazsonyi@bitrise.io
---

What is the Trigger Map? It's a mapping between `trigger expressions` and Workflows. Eg.: On [Bitrise](https://www.bitrise.io) the trigger expression is the name of the given branch and in our [Command Line Interface](https://github.com/bitrise-io/bitrise) the expression you set in `bitrise trigger <trigger_expression>`.

The `trigger expressions` can contain wildcard characters so it is possible to:
- Run the same Workflow for every Trigger
- Run the same Workflow for every branch that has the name `<expression>*`
- Or to run builds only for specific Triggers

To get you started here are two examples:

In the first example the `feature` Workflow runs for every trigger (branch name) that starts with `feature/`. The `masterwf` Workflow is started when the trigger is `master` **except** if it was triggered by a Pull Request. Finally, every other trigger is handled by the `primary` Workflow, which functions like a `catch all` Workflow.


    trigger_map:
      - pattern: feature/*
        is_pull_request_allowed: true
        workflow: feature
      - pattern: master
        is_pull_request_allowed: false
        workflow: masterwf
      - pattern: "*"
        is_pull_request_allowed: true
        workflow: primary


In the second example a build is only started if the trigger expression is master **except** if it is a Pull Request. For other triggers no build is started.


    trigger_map:
      - pattern: master
        is_pull_request_allowed: false
        workflow: masterwf


You can read more about the Trigger Map at our [Devcenter](http://devcenter.bitrise.io) in [Lesson 6 Pull the trigger on the Workflow](http://devcenter.bitrise.io/webhooks/trigger-map/)

Happy Building!
