Bitrise Blog
=============

To start the middleman server:

    $ middleman server

To add a new post/article:

    $ middleman article "Title of the article"

URL: [http://blog.bitrise.io/](http://blog.bitrise.io/)

# Tagging guideline

* announcement : Bitrise service announcements (new features, changes in existing features)
* status : Bitrise status announcements (maintenance schedule, third party service issues)
* step-update : New Step and Step update news
* box-update : New Box and Box update news
* [ios]-dev : iOS development related news highlights
  * the first part of the tag marks the platform, for example an osx related news highlight would be
    tagged as *osx-dev*.
* community : anything Bitrise community related, for example new tutorial announcements


# Version number (git tag) guideline

The version number (git tag) is a three part version id.

1. The first number is the *major* version: incremented when the structure of the blog changes.
2. The second number is the *minor* version: incremented when a new post is added.
3. The third number is the *bugfix* version: incremented when a typo or other content fix is applied.
