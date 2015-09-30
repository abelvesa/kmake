# KMake
The Kernel Maker

## What is it
kmake wraps up a build for a linux kernel to ease through the repetitive tasks a kernel developer may have to partake in.

## Why wrap it ... why not use ...

Yes you could use ... {yocto,buildroot,$YOURBUILDSYSTEM},
but kmakes goals are to help with the actual development cycle, rather than just being a package builder

## Requirements/Features

* Set up appropriate -j flags
* Automatically obtain kernels from git if necessary
* Easily facilitate the edit/compile/install/test loop
* Integrate with notify-send so you can leave long jobs running and do something else
* A build should not rely on 'environment variables'
* * You should be able to type make (or kmake) in any shell

