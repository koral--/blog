---
title: What's new after the maintenance and migration guide
date: 2015-09-14 18:08 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

# Maintenance and "Bitrise V2" summary

Why did we decide to upgrade our whole infrastucture and migrate to a new format? Here's a short list about the major advantages of the new system:

* Fixed the architectural and format issues we collected during the last 1+ year, since we released the first version of the Step Library based [Bitrise](https://www.bitrise.io).
* **Open source runner**, which you can use on your own Mac! (See it on [GitHub](https://github.com/bitrise-io/bitrise)).
* Alternative Step download location handling: the new system can retrieve the step codes (which are shared in a Step Collection) if GitHub would go down, from an Amazon S3 cache.
* Lots of new feature, you can check the **What's new** section below for a list of summary.



## Migration guide

This is a guide for those who experience issues after last weekend's maintenance. If you don't have any issue you can skip this.

* Check your app's Workflow (open your app's page on bitrise.io then select the **Workflow** tab) and if you see that an update is available for a Step you should update it to the latest version. This is especially important for the `Certificate and profile installer`, `Xcode Analyze`, `Xcode Archive` and `Ruby Script` steps.
* **If you experience Code Signing issues** with an app which worked before the maintenance you should: update the Xcode and Certificate steps to the latest version and set the `Use force code signing attributes?` option to `yes`.
* Make sure that you **turn off** the `Replace variables in input?` for every **script content** input (`Bash Script` step - `Script content` input). We saw a couple of cases where it was converted to be turned on - should be *turned off*.
* If you have an old "Xcode Build" step you should remove it, as it does not generate any useful outputs and so we did not migrate it to the new Step Library. If you still want to keep it *let us know* and we'll help you!

### Guide for Step Developers

* Right now the steps are running in a **non login** bash shell, which means that `~/.bash_profile` is no longer auto loaded. If, for some reason you would need it you have to manually `source ~/.bash_profile`. If you used the `~/.bash_profile` for exporting custom outputs/environment variables you should migrate to use [envman](https://github.com/bitrise-io/envman) as noted in the **What's new** section below.
* **For custom Steps and step developers**: the Steps' working directory changed! It's no longer set to the Script's own directory, but to the path where the cloned App code is! This means that if you used a relative reference to a file in your own, custom step you should now get the absolute path of the actual Script. You can do this in Bash with `THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"`, and then use `$THIS_SCRIPT_DIR` to reference relative files in your Step's code, for example: `bash "$THIS_SCRIPT_DIR/my_other_script.sh"`.

**P.S.: If you find any issue with your converted Workflow [let us know](https://www.bitrise.io/contact)!** We still have backups of your original workflow data (stored securely for the next 1 month) if you would need it.


## What's new

A **LOT**, actually. Your previous configurations should still work (if not please check the Migration Guide below, and if that doesn't help [report it!](https://www.bitrise.io/contact)), but there are new features which you can migrate to use:

* **Download and Upload your Bitrise configuration** (`bitrise.yml`), and run it on your own Mac! We'll share a bit more information about this feature soon. In short, you can export your full configuration from the **Workflow Editor**, save it to a file called `bitrise.yml` and run it with the [bitrise CLI](https://github.com/bitrise-io/bitrise)! We're still working on making the whole process easier. The goal is to reduce the process to just a `bitrise download` call - we'll post about this with more details once it's ready.
* Proper **secrets handling for Pull Requests** (and future Public apps 😉): you can now find a **Secrete Environment Variables** section in your app's Workflow Editor. As noted there the environment variables defined there are **not** exposed for Pull Requests, will only be available for non Pull Request builds. **You should migrate every password, token and other sensitive information** into this storage. Of course this is mainly important if you have public Pull Requests for your (open source) project. For the [bitrise CLI](https://github.com/bitrise-io/bitrise) you can save these into a `.bitrise.secrets.yml` file, to separate from the actual, shared configuration data!
* **Define your own rules for triggering workflows, based on git branches!** With the new `trigger_map` you can control that if a code push happens on a given branch which *Workflow* should be used for the build.
* You can now **easily export environment variables from any script/step code** with [envman](https://github.com/bitrise-io/envman) (automatically installed if you install the [bitrise CLI](https://github.com/bitrise-io/bitrise)). As noted in `envman`'s readme it's as easy as: `envman add --key MY_KEY --value 'your value to share'`, or in case you want to expose a more complex text you can also use `envman` with a piped input: `echo "A complex, possibly multiline input" | envman add --key MY_KEY`. No more struggling with exporting environments through the `~/.bash_profile` file!
* **Share your own Step** easily with [stepman](https://github.com/bitrise-io/stepman) (automatically installed if you install the [bitrise CLI](https://github.com/bitrise-io/bitrise)). It's easier than every before, `stepman` has built-in, detailed guides, just call `stepman share` and follow the printed steps. It's that easy!

We're working on finishing a couple of other new features and UX issues, we'll soon update our documentation to properly cover these topics, and release new blog posts about the new features, with more details.


Thank you for joining us in this great journey, to bring back to joy of mobile app development, and being an awesome part of [Bitrise](https://www.bitrise.io)!

Happy building!
