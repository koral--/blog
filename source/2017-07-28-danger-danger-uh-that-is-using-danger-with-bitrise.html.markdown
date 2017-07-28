---
title: Danger! Danger! Uh, that is... Using Danger with Bitrise
date: 2017-07-28 12:35 UTC
tags: how-to
authors: Anna Bátki|anna.batki@bitrise.io
overlay: /images/danger_blog.jpg

---
##About Danger

"[__Danger__](http://danger.systems/) runs during your CI process, and gives teams the chance to automate common code review chores.
This provides another logical step in your build, through this Danger can help lint your rote tasks in daily code review.
You can use Danger to codify your teams norms. Leaving humans to think about harder problems.
She does this by leaving messages inside your PRs based on rules that you create with the Ruby scripting language.
Over time, as rules are adhered to, the message is amended to reflect the current state of the code review."

([Source](http://danger.systems/ruby/))

##Setting it all up!

> [__Bundler__](http://bundler.io/) is a dependency manager for Ruby which uses a Gemfile to define all of the Ruby projects you want to use.

Let's open up your Terminal app and head to your project's path. If you don't have Bundler installed to your system, type in the following command. If you hit any permission issues try with `sudo`.

<pre><code># If you need to install bundler
gem install bundler
</code></pre>

If you don't have a Gemfile in your app's repository, type in `bundler init` in your project folder. This creates your Gemfile.

Also while we are here, let's add the `Danger` gem to the Gemfile. We will use Ruby for `Danger`, however you can use [Javascript](http://danger.systems/js/) as well for the setup.

<pre><code># Create a Gemfile
bundler init

# Adding the Danger gem to the Gemfile
echo "gem 'danger'" >> Gemfile
</code></pre>

This will generate the following Gemfile for you.

<pre><code># frozen_string_literal: true
source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
gem 'danger'
</code></pre>

You can also open the Gemfile in your favorite editor and remove `#gem 'rails'` to keep it nice and tidy.

Now you can install and validate the installed version:

<pre><code>bundle install
bundle exec danger --version
</code></pre>

> It's a common practice to install the gem this way, not globally. This way you can make sure that anyone who joins the team will be using the same version as you are. Don't forget to commit the `Gemfile` and `Gemfile.lock` file to your repository!

##Adding Danger to your project

The easiest way to add Danger to your project is to run

<pre><code>bundle exec danger init</code></pre>

This will guide you through the setup and it will automatically create a sample Danger file for you, but on GitHub you have to create a new Bot user for your project and also a Personal Access Token for said Bot. (Save this token, we will add it later to [Bitrise](https://www.bitrise.io?utm_source=blog).) If it's a closed project you will need to add the Bot as a collaborator.

Commit your `Dangerfile` and push all the changes to the repository.

##Setting it up on Bitrise

Add your app to [Bitrise](https://www.bitrise.io?utm_source=blog), go to your Workflow Editor and add the newly generated token as an environment variable. For GitHub projects use `DANGER_GITHUB_API_TOKEN`

![Danger Environment Variables](danger_env_vars.png)

Then add a script step after your tests with the following content:

<pre><code>#!/bin/bash
set -ex

bundle install

## Running Danger
bundle exec danger
</code></pre>

You can also change your `bitrise.yml` file to make sure `Danger` is only running for pull requests.

<pre><code>- script@1.1.4:
    run_if: .IsPR
    inputs:
    - content: |-
        #!/bin/bash
        set -ex

        bundle install

        # Running Danger
        bundle exec danger
</code></pre>

Now that we are all set up, let's see some cool examples! 👾

## Mark Work In Progress pull requests 🔨

Let's start with the initially created `Dangerfile` in your repository.

If you open up the file you will see the following lines in it. This will make sure that your Work In Progress Pull Requests are visible for your team as well.

<pre><code># Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"
</code></pre>

To test this, create a new branch with a simple Readme file change and when you are done with everything push it to the repository and create a pull request, with `[WIP]` in the title.

If you've set up everything correctly, you should see this appearing in your PR:

![Danger - Work In Progress check](danger_wip.png)

## Check for release notes changes 📋

Let's change your `Dangerfile` a bit and add a logic that checks for your release notes file.

During the check we can validate every non-trivial Pull Request whether the `release_notes.txt` file was changed or not. If not, we can simply return an error for the Pull Request.

<pre><code># Fail if release notes are not updated
release_notes_updated = git.modified_files.include? "release_notes.txt"
fail "You forgot to update your release notes file" if !declared_trivial && !release_notes_updated
</code></pre>

Let's commit this to a new branch and create a Pull Request. After running it on [Bitrise](https://www.bitrise.io?utm_source=blog) you will see the error as we did not change the required file at all.

![Danger - Check for updated release notes](danger_release_notes.png)

## List those build artifacts 📱

If you would like to include your IPA or APK file in the Pull Request for your testers, you can simply do so by moving your `script step` after the `Bitrise deploy step` in your app's Workflow Editor on [Bitrise](https://www.bitrise.io?utm_source=blog) and then changing your `Dangerfile`:

<pre><code># Public install page
public_install_page_url = ENV['BITRISE_PUBLIC_INSTALL_PAGE_URL']
message("📱 [New app deployed to Bitrise](#{public_install_page_url})") if public_install_page_url
</code></pre>

After running a new build you and your QA guys should see this:

![Danger - List deployed apps](danger_deploy.png)

##Limitless possibilities

We just wanted to show you a couple of examples on how you can integrate Danger into your [Bitrise](https://www.bitrise.io?utm_source=blog) workflow. But there is more to it, as usual. 😱

We are very keen on learning about your use-cases, so if you are working on this, definitely let us know here or on our Slack channel! 😍

Happy coding! 🚀
