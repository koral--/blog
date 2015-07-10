---
title: Amazon S3 network issues - patch coming with a new Virtual Machine update
date: 2015-03-09 11:20 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

We just finished with the first weekly Virtual Machine
update and everything seemed to be working correctly.
This was a very important change we planned to do
for a while.

Lately we started to detect Amazon S3 upload errors,
usually with an error message:

    The difference between the request time and the current time is too large.

We identified the problem, the time sync issue is related
to one of the core components we install into the Virtual Machine
to boost its performance.

Unfortunately this issue can't be solved without a Virtual Machine
update and so we'll once again update the build virtual machines
as soon as possible.

*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*


## Full disclosure

To be able to deliver a new virtual machine
update every week we had to improve our internal tools
to make the whole process (virtual machine preparation, deployment and update)
more automated.

Additionally a weekly update schedule helps us
to experiment with changes which can make the system (and builds)
perform better.

We always perform a lot of automated and manual tests
on the virtual machine before we would release the new version.

Unfortunately this time synchronization issue
only started to happen after the virtual machine updates
which we did during the weekend.

We're truly sorry for the issues this might cause
and we'll make sure that the new update contains the
previous, stable solution which we used before.



