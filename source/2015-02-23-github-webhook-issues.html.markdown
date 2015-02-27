---
title: GitHub webhook issues
date: 2015-02-23 18:08 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

We always try to provide secure solutions for our whole platform
and as part of this we plan to enforce HTTPS on all of our
pages and API endpoints.

Yesterday night we rolled out a version of Bitrise which
redirected every HTTP page and API call to it's HTTPS
equivalent but unfortunately it broke the GitHub
webhooks for older repositories which were registered
with an HTTP hook URL.

We're terribly sorry for this and rolled back
the site to it's previous version right after we discovered
this issue. We'll keep working on providing compatibility
with every existing part of our site before we try
to deploy the version which enforces HTTPS.

> As always if you have any issues or suggestion
> you can [contact us](http://www.bitrise.io/contact?utm_source=blog&utm_medium=blog&utm_campaign=bitrise){:target="_blank"}
> or leave a comment below,
> we're happy to help
> and to discuss about Bitrise.