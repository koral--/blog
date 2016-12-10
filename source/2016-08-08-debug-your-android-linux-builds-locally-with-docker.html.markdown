---
title: "Debug your Android/Linux builds locally, with Docker"
date: 2016-08-08 16:03 UTC
tags: tutorial, code-signing
authors: Viktor Benei|viktorbenei@bitrise.io
---

For local debugging you can use our [open source Bitrise CLI](https://github.com/bitrise-io/bitrise),
which you can run on your Mac/Linux. Using the CLI can be an efficient tool
to configure your builds, and do basic debugging of the configuration.

There are cases when this will not be enough, as the issue is related to a missing dependency
or something else, which can be found on your Mac/Linux, but it's not part of your
repository or your dependencies. This means that the file / dependency will not be available
on Bitrise.io, but it might be available on your machine, which will result in the
situation that although your build works on your Mac/Linux, it does not on [bitrise.io](https://www.bitrise.io/).

There are of course other things which can lead to a situation like this, not just
dependencies - one other thing which came up frequently in the past is when
someone uses absolute file paths in the code / project file. This is another case
when it will work on your Mac/Linux, but not on [bitrise.io](https://www.bitrise.io/), as the user and paths
are most likely not the same.

In these cases using the `Bitrise CLI` alone will not be enough, as the issue is
related to the environment the build runs in, and not to the tools and configurations
you use during your builds.

Fortunately, in case you use the Linux/Android stack there's an awesome tool
which can be used to reproduce the environment, so that __you can run your build in the same environment
as it runs on [bitrise.io](https://www.bitrise.io/)!__

This tool is called [docker](https://www.docker.com/), and it's meant to solve the
problem of plackaging full OS environments (well, it's more than that, but for us
this is one of the most important aspect, for debuggin).

The concept is quite simple: you can describe your environment using a `Dockerfile`,
which then can be built and packaged using `docker`, and distributed through
a docker container hosting service like [hub.docker.com](https://hub.docker.com/).

Unfortunately, although `docker` can run on Linux, Mac and Windows, it can only
run Linux "containers" (a container is similar to a virtual machine), so we can
only provide Linux images today (our Android stack runs Linux - Ubuntu to be precise).
We'll see if `docker` will expand the supported guest/container platforms in the future,
or if we can find any other way to let you download and use our Mac OS images,
right now this only works for Linux stacks, but we always keep an eye on new
virtualization tools, and looking for a solution for Mac OS.

So, back to the original topic, if you use our Android/Linux stack
on [bitrise.io](https://www.bitrise.io/) you can download the Docker image
and run it on your own Mac/PC, to be able to debug your builds
__in the exact same environment__ you have on [bitrise.io](https://www.bitrise.io/) -
we use the same docker images on [bitrise.io](https://www.bitrise.io/)!

The process is quite simple once you learned the basics of Docker (and the Bitrise CLI),
and can be done with pretty much two Terminal / Command Line commands.
You can find the related guide, with links, pointers and explanation
[here, on our new DevCenter](https://bitrise-io.github.io/devcenter/docker/run-your-build-locally-in-docker/).

_Be prepared_, the initial download of the image can take quite some time
and requires 10+ GB free disk space, as it includes all the preinstalled tools
and Android packages you can access in your [bitrise.io](https://www.bitrise.io/) builds.
But __once you have the docker image, creating containers and running builds
(using the image) takes only a seconds!__

__[Link to the guide](https://bitrise-io.github.io/devcenter/docker/run-your-build-locally-in-docker/)__

-----


__About the new DevCenter__

We're working on moving from our current DevCenter to this new one.
For now we host the new DevCenter as a GitHub pages website,
but eventually it'll replace [devcenter.bitrise.io](http://devcenter.bitrise.io)
as the primary / official DevCenter.

_Why do we move the DevCenter?_ One of the primary reasons
is that it is now completely __open source__, you can find the DevCenter's code
[on GitHub](https://github.com/bitrise-io/devcenter) - __feel free to edit
any page__, you can do that directly on GitHub (you can do it directly on the GitHub web UI, by opening
any file and clicking the _pencil_ button)!

There are other reasons, both technical (the whole DevCenter can be generated
as a static website, using [MkDocs](http://www.mkdocs.org/)) and user experience (e.g. better search)
related.

As part of the transition we're also performing reviews on the existing DevCenter
pages, to make sure we don't have outdated docs on the new DevCenter - that's
why it takes more time to clomplete the transition.

We think the new DevCenter will be an improvement for every __Bitrise__ user,
even if you don't want to contribute / correct anything.
If you have any feedback, feel free to create an issue on the
[DevCenter's GitHub page](https://github.com/bitrise-io/devcenter).

**Happy Building!** 🚀
