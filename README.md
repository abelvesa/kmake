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

## About this fork

This has been forked from Keiran's [KMake](https://github.com/kbingham/kmake).

This fork includes defconfigs, board specific makefiles and build environments.

## How

First, install it:

```
cd kmake;
sudo make install;
```

Then add the user .kmake config in homedir and set the KMAKE_REPO path

```
echo "KMAKE_REPO := <path to repo>" > ~/.kmake
```

Then go to your kernel tree and run whatever config target you want from ones existing currently in the kmake repo. Autocomplete will list all kmake targets along with ones provided by the kernel tree.
For example:

```
kmake mrproper
kmake config/qcom/x1e80100/devkit
kmake menuconfig
```

And then:

```
kmake
```

to build.

Note that you can also edit the build env and tailor it to your needs. See your build/.kmake.

