---
title: Technical update - Pricate Cocoapods support
date: 2014-11-17 16:48 UTC
tags: announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Private CocoaPods repository support

We've made some changes in how SSH is handled and from now on
you can use the same SSH key for your private CocoaPods
repositories which you use for your main repository.

This way you can add your project even if you use private
CocoaPods repositories. The only thing you have to
keep in mind is that these pod repositories have to be accessed
through SSH and with the same SSH key you use for your main
repository.

So if you have a Podfile with inline pod urls like
this one

    pod 'MyPod', :git => '...'

make sure that the :git url is an SSH url, 
which usually looks like this:

    pod 'MyPod', :git => 'git@host.com:team-name/pod-repo.git'

If you use a private pod spec repository you'll have to
include it as a *source* with the SSH url too, similar to this:

    source 'git@host.com:team-name/pod-spec.git'


## New default workflows

If you add a new repository you'll get a new default Workflow
for it. What we changed is **we added a new Step to the
default Workflow**, the "SSH key activator" step.

This new step adds your specified SSH key (the one use
used when you added your App, unless you added a public repository)
to the ssh-agent. After this step
completes you can use any SSH based communication step
without implicitly specifying the SSH key.

Which are the SSH based steps? There's two which you
probably use: the Git Clone step (unless you added
a public repository) and the CocoaPods step if
you use private pods.


## Case insensitive podfile search

This one is a less significant improvement but still
an important one as we try to make iOS continuous
integration and delivery as painless as possible.

As noted by one of our valued member
if you had a podfile which didn't match the **Podfile**
name exactly the validation during the Add New App process
failed to detect it.

**We fixed that and the podfile detection is now case
insensitive**, so you can use the naming style you want to.


## New design coming soon

We're working on a complete redesign which will be
pushed to bitrise.io in the coming weeks.

We're really excited as we think the new user experience
will be way more polished - you sent us quite a few
feedback in the last weeks and we discussed each one
and kept in mind while we were working on the revisions.

> As usual if you have any issues or suggestion
> you can [contact us](http://www.bitrise.io/contact){:target="_blank"},
> we're always happy to help
> or discuss about how Bitrise works.
