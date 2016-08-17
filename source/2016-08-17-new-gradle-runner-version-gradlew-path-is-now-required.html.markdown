---
title: New Gradle Runner version - gradlew path is now required
date: 2016-08-17 16:29 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

Today we pushed a new version of the `Gradle Runner` step (`v1.4.x`), which introduced
a couple of revisions, cleanups, and minor compatibility breaks.

The first important change is that `gradlew` path is now required.
The reason for this is that using `gradlew` was always the recommended
way, as you can see it in the [official Gradle guide](https://docs.gradle.org/current/userguide/gradle_wrapper.html).
The Gradle Wrapper (`gradlew`) is the official "gradle version manager",
the tool which makes sure that the right Gradle version is installed
and is used for your build.

Otherwise, if you don't use `gradlew` but `gradle` directly,
you might get an error like:

```
Minimum supported Gradle version is 2.14.1. Current version is 2.10. If using the gradle wrapper, try editing the distributionUrl in .../gradle-wrapper.properties to gradle-2.14.1-all.zip
```

The second change was the removal of the `workdir` input.
This was mainly required to be compatible with how other Gradle steps (e.g. `Gradle Unit Test`)
handle paths (e.g. `gradlew` path).
If you did use the `workdir` input, the same effect can now be achieved with one (or two)
`change-workdir` steps - for more information see the "Migration guide" section below.

## Migration guide

> If you don't have time for the migration right now, all you have to do
> is to __not to upgrade__ to the `1.4.x` version of the `Gradle Runner` step,
> you can keep using `1.3.x` or below.

If you did not use the `workdir` input, all you have to do is to specify
the `gradlew` file path. You can do this directly in the Step's input,
but the recommended way (which is how if you add a new Android project
__bitrise.io__ will set the base configuration up for it) is to use an
environment variable - probably the best to add it as an `App Env Var`,
in the Workflow Editor.

To do this, you should open your app, go to the `Workflow` tab,
click Manage Workflows to open the Workflow Editor.
Now, just to be sure, you should click on the `Gradle Runner` step
and check what's set as the value for the input: `gradlew file path`.
The default value is most likely `$GRADLEW_PATH`, but depending
on when you added your app it might be something different.

Now that you know what which environment variable is set,
all what's left to do is:

1. click on `App Env Vars` on the left side of the Workflow Editor
2. check if you already have the environment variable there
3. if not, add it
4. the key should be: `GRADLEW_PATH` (without the leading `$`!)
5. value should be the path of the `gradlew` file, __relative to your repository's root!__ (e.g. `./gradlew`, or if it's in a sub directory `./sub/dir/gradlew`)

It should look something like this:

![gradlew App Env Var example](gradlew-app-env-var-example.png)

Hit `Save` on the left side, and you're done! 😉

If you prefer `bitrise.yml` mode, this is an example, using our [Sample Android App](https://github.com/bitrise-samples/sample-apps-android-sdk22):

<pre><code>
---
format_version: 1.2.0
default_step_lib_source: https://github.com/bitrise-io/bitrise-steplib.git

app:
  envs:
  - opts:
      is_expand: false
    GRADLE_BUILD_FILE_PATH: build.gradle
  - opts:
      is_expand: false
    GRADLE_TASK: assemble
  - opts:
      is_expand: false
    GRADLEW_PATH: "./gradlew"

trigger_map:
- pattern: "*"
  is_pull_request_allowed: true
  workflow: primary

workflows:

  primary:
    steps:
    - activate-ssh-key@3.1.1:
        run_if: '{{getenv "SSH_RSA_PRIVATE_KEY" | ne ""}}'
    - git-clone@3.3.3: {}
    - script@1.1.2:
        title: Do anything with Script step
    - gradle-runner@1.4.1:
        inputs:
        - gradle_task: "$GRADLE_TASK"
    - deploy-to-bitrise-io@1.2.4: {}
</code></pre>

__If you did use the `workdir` input__, the recommended migration is to add the subdirectory
path (the one you had in `workdir`) to the path inputs (e.g. `gradlew` path, `gradle build file` path).
Simply, if your `workdir` was `./sub/dir` and your `gradle build file path` was `./build.gradle`,
just change the `gradle build file path` (and every other relative path input) to `./sub/dir/build.gradle`.

An alternative solution is to use the
`Change Working Directory for subsequent Steps` (`change-workdir`) step, right __before__
the `Gradle Runner` step, and then __another one right after__ the `Gradle Runner` step,
to change the workdir back. _Note: you can use `..` as the value for the `change-workdir` step's
path input to change the workdir __one level up__, `../..` to switch two levels up, etc._

Of course, as always, __if you'd have any issue with the migration [please contact us](https://www.bitrise.io/contact)__
and we'll help you sort it out in no time!

**Happy Building!** 🚀
