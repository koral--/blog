---
title: The New DevCenter has finally arrived!!
date: 2016-12-12 09:41 UTC
tags: announcement, features, changelog, community
authors: Viktor Benei|viktorbenei@bitrise.io
---

Yes, you read that right!
We finally managed to complete the migration and update
of the [DevCenter](http://devcenter.bitrise.io/),
something we had in works for quite some time now.

The new DevCenter is __completely open source__, you can find its
[source code on GitHub](https://github.com/bitrise-io/devcenter),
and __every page of the DevCenter includes links to edit that page__
directly on GitHub (and to easily send a Pull Request with your fixes / suggestions),
as well __quick links to create GitHub issues with an automatic reference to the page__.

__Why did it take so long?__ We have more than a 100 articles on our DevCenter,
and we wanted to go through all, update links and texts to get it up to date
as much as possible. The transition also involved removing a couple of
now irrelevant articles, and adding completely new ones.

For example, the [Bitrise CLI and bitrise.yml](http://devcenter.bitrise.io/bitrise-cli/)
section was rewritten from the ground up. When we wrote the original section
for our previous DevCenter we were still kind of new to the CLI, as the
current [open source Bitrise CLI](https://www.bitrise.io/cli) just replaced
our previous, closed source solution. A lot has changed since, the CLI
evolved rapidly, especially since we switched to
[monthly releases](http://blog.bitrise.io/2016/04/13/new-version-of-the-bitrise-cli-1-3-0-is-finally-released.html),
and we now automate the development, testing and distribution of the [bitrise.io](https://www.bitrise.io)
website, our [blog](https://github.com/bitrise-io/blog) and now the new [DevCenter](https://github.com/bitrise-io/devcenter),
in addition to lots of mobile apps and [sample projects](https://github.com/bitrise-samples)
using the `Bitrise CLI`.

With the updated DevCenter we tried our best to guide you through the vast `Bitrise` ecosystem,
including both the [bitrise.io](https://www.bitrise.io) web service and our
[open source build runner / CLI](https://www.bitrise.io/cli), and
__we're determined to keep it that way__.
So, __if you'd have a question or issue related to a page of the DevCenter__,
feel free to click the _create an issue on the DevCenter's GitHub page_,
link which __you can find at the bottom of every page__ on the DevCenter,
to let us know where the docs should be improved.


## How we deploy the DevCenter to GitHub Pages

Finally, __a couple of technical details__ about the DevCenter.

The full source code can be found on [GitHub](https://github.com/bitrise-io/devcenter),
and can be built into a completely static website using the wonderful
[MkDocs](http://www.mkdocs.org/) tool.

The repository includes the `bitrise.yml`
we use for testing, building and distributing the DevCenter,
so you can just `bitrise run setup` to install the required tools on a Mac/Linux,
start the local webserver with `bitrise run up`, run the tests with `bitrise run ci`,
and distribute it with `bitrise run deploy-to-github-pages`.

The current "compiled" static site can also be found on the
[gh-pages branch](https://github.com/bitrise-io/devcenter/tree/gh-pages)
of the GitHub repository.

We use a wide variety of tools for our services,
for example our Blog (which is also [open source](https://github.com/bitrise-io/blog))
uses [middleman](https://middlemanapp.com/), also compiled to a static site
which is hosted on Amazon S3. You can find a related guide,
well, [on our DevCenter](http://devcenter.bitrise.io/tutorials/auto-deploy-middleman-project/) ;)

For the DevCenter we wanted to try another tool, so we went with [MkDocs](http://www.mkdocs.org/)
for organizing and building the code, and [GitHub Pages](https://pages.github.com/)
for hosting the static site. This was our first project to utilize GitHub Pages,
and we were pleasantly surprised. Deploying the repository to GitHub Pages
is quite straightforward, once you understand the two types of sources it supports:

1. You can use GitHub Pages' built in [Jekyll](https://jekyllrb.com/) feature.
1. Or you can build your static HTML, css, js, .. resources, and store that on the `gh-pages` branch directly.

As we decided to use `MkDocs` and we wanted to keep our options open (if we'd
decide to host the devcenter somewhere else in the future) we went with the second option.
Generating all the static resources with `MkDocs` is as simple as running `mkdocs build --clean`,
which by default will generate the files into a `site/` subdirectory.
All we had to automate is to run `mkdocs build --clean`, and sync the `site/` directory
to the `gh-pages` branch using simple `git` commands.
(You can see the exact commands we run in the devcenter's _bitrise.yml_
[in the `deploy-to-github-pages` workflow](https://github.com/bitrise-io/devcenter/blob/master/bitrise.yml))

That's all, once you push your generated resource files to the `gh-pages` branch
GitHub will pick it up automatically and make it available under a `*.github.io/` URL.
During the migration of the DevCenter we did use this URL (`bitrise-io.github.io/devcenter`
in case of our DevCenter) and we had absolutely no issue with it.

Once we decided it's time to replace [devcenter.bitrise.io](http://devcenter.bitrise.io),
to point to this GitHub pages domain instead of the old devcenter's servers
we had to configure a couple of additional things. The official documentation
did not include every detail, although it was quite good to get started.

We ended up adding a `CNAME` entry on our DNS service ([dnsimple](https://dnsimple.com))
pointing to our GitHub organization's GitHub pages URL (`bitrise-io.github.io`).
(_Note, we started with an `ALIAS` entry but we got a warning on GitHub
after the first deploy, suggesting to use a `CNAME` instead, so we replaced
the `ALIAS` with a `CNAME` entry_)

As the devcenter is a repository of the `bitrise-io` organization on GitHub,
simply opening `bitrise-io.github.io` will not work, its GitHub pages
URL is `bitrise-io.github.io/devcenter`. So, what's missing?
You have to define this "custom domain" (`devcenter.bitrise.io` in our case)
on GitHub too. We did that, setting `devcenter.bitrise.io` as the _Custom domain_
in the Settings of the repository on GitHub, and everything worked in less than a minute!

We were thrilled, as we could figure out these details in less than an hour,
and everything seemed to work properly! __But then we went ahead and published a change__
and a new release of the DevCenter with some minor
modifications, went to check it on [devcenter.bitrise.io](http://devcenter.bitrise.io/)
and... __The site was gone O_O__

To be precise, when we visited [devcenter.bitrise.io](http://devcenter.bitrise.io/)
the 404 page of `bitrise-io.github.io` was presented. We were surprised
and thought we messed something up. Double checked the configurations, and
we found that our __Custom domain__ configuration disappeared from
the GitHub repository settings. First we thought that was something we did
accidentally, so we did set it again, and the site came back - hurray!!
Then we went ahead and deployed another change and the site was gone again..

This is most likely a bug on GitHub right now, and it might only affect
sites which don't utilize `Jekyll` and instead publish the compiled
files directly to the `gh-pages` branch, but the behavior was consistent;
after every deploy the _Custom domain_ entry disappeared from GitHub
repository settings.

__The solution__ was quite simple, although we had to go through
quite a couple of GitHub documentation pages until we realized that there's
another option to set the _Custom domain_ for GitHub pages.
The _old school_ way (which was the only way before the _Custom domain_
option was added to the GitHub UI) is to add a `CNAME` file
to the root directory of the `gh-pages` branch, with nothing but
the custom domain URL as the content of the file.
In our case this was a simple one liner, added to the deployment script:
`echo "devcenter.bitrise.io" > CNAME`, right before committing and pushing
to the `gh-pages` branch.

We now __deployed quite a few updates to the DevCenter, with nothing but merging the Pull Request including the change__
- __everything else is handled by [bitrise.io](https://www.bitrise.io) and GitHub pages automatically!__
No issues, it just "magically" works!
_If you're interested, you can find the full configuration we use in the
[bitrise.yml file, in the DevCenter's GitHub repository](https://github.com/bitrise-io/devcenter/blob/master/bitrise.yml)!_
