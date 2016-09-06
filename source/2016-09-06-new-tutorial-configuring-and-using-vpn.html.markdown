---
title: New Tutorial - Configuring and using VPN
date: 2016-09-06 15:39 UTC
tags: tutorial, announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

Finally we had the time to write this tutorial. It's been on our list
for quite some time, and, with the help of one of our users,
we could finalize and publish a DevCenter tutorial
about how you can [Configure and connect to your VPN](https://bitrise-io.github.io/devcenter/tutorials/vpn-configuration/).

_App setup note if you need the VPN connection to be able to `git clone` your repository_:
you can't customize the App registration process, so for now the easiest way is to:

1. Register a repository which doesn't require a VPN connection (this can be one of our Sample apps you can choose on the Add New App page)
1. Then go to the new App's `Settings` tab and change the `REPOSITORY URL` to your VPN protected repository's git clone URL
1. Open the `Workflow Editor` by going to the `Workflow` tab and click `Manage Workflows`
1. Configure your Workflow [as explained in the tutorial](https://bitrise-io.github.io/devcenter/tutorials/vpn-configuration/)
1. Save the Workflow, and start a build

We hope this will help everyone who wants to (or have to) use
a VPN connection in their build, but if you'd have any issue
feel free to create a Pull Request in the [new DevCenter](https://github.com/bitrise-io/devcenter/),
or [contact us](https://www.bitrise.io/contact).
