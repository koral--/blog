---
title: More disk space on Xamarin Stable
date: 2016-08-17 08:35 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

As we noted in our previous [Xcode 8.0 beta 6](/2016/08/16/xcode-8-0-beta-6.html) post
we're working on adding more free disk space to our new & upcoming virtual machines.

Recently we had a couple of reports that the free disk space (~9GB) on the Xamarin stacks
is not sufficient enough.

We're preparing for the new Mac OS Sierra support, which will
require full new installs of Mac OS, and as part of the process we performed a lot of
test provisioning of Mac OS virtual machine images, from start to finish.
Once we could confirm that [the scripts we use for provisioning](https://github.com/bitrise-io/osx-box-bootstrap)
are up to date and include every required step, we were able to create
brand new Mac OS test images automatically, and finally we felt confident enough
to do a full new provision for Xamarin.

Once the new VM image was ready we ran all of our existing tests for Xamarin,
including control builds (the ones we run periodically on existing Xamarin stacks too,
to detect possible issues) and everything seemed to work correctly.
So, yesterday we started to roll out the new Xamarin Stable virtual machine images
for everyone who uses the Xamarin Stable stack on [bitrise.io](https://www.bitrise.io/).

_Everything what was used during the provisioning / creation of the virtual machine image
can be found on GitHub at [https://github.com/bitrise-io/osx-box-bootstrap](https://github.com/bitrise-io/osx-box-bootstrap),
and nothing else was used for creating it!_

The migration was completed, so anyone who uses the Xamarin Stable stack runs their
builds using the new image now! Our statistics and tests show no sign of any issue
related to the new image, but __if you'd experience any issue with the new Xamarin Stable
image, [please let us know!](https://www.bitrise.io/contact)__


## What's new?

- The most important thing: the virtual machine is now created with 200 GB storage,
  which means __about 108 GB free disk space__ on the current Xamarin Stable configuration!
- It was built on the latest and greatest (non beta) Mac OS version, `10.11.6`.
- Git LFS is preinstalled
- `wine` no longer preinstalled

You can find [the complate stack update diff on GitHub](https://github.com/bitrise-io/bitrise.io/commit/1756cab23bd934a9f329a2e374361dd4475cbf96),
as well as the [full system report of the Xamarin Stable stack](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log).

**Happy Building!** 🚀
