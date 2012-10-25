OVERVIEW

This series of patches allows for incremental upgrades between drupal versions. The patches modify only the files affected by the upgrade, and leave all other files untouched.

USAGE:

The patches are labeled in two ways: version_to_version, and single version.  Single versions are incremental patches from the version which precedes to the version in the title (i.e., 6.11 is 6.10 to 6.11). These patches MUST be applied incrementally, you cannot jump version numbers.  So, 6.10 to 6.11 is fine, 6.10 to 6.22 is NOT FINE.  Be sure to apply the patch which corresponds to your distribution of drupal. 

Version_to_version patches are just that, and include all the versions in-between.  This can mean a variety of bug-fixes and new features to work through in testing, but is much faster than the incremental patches.

There are a few patches for moving from drupal to pressflow.  They seem to work fine, so far.

Patches must be run either:

1. From drupal docroot using the 'patch' command: patch -p1 > /path/to/patches/drupal/version.patch.  This method works whether the docroot is a 'gitted' or not.
2. From a git-initialized drupal docroot, run something like this: 'git apply -v --ignore-whitespace /path/to/patches/drupal/version.patch'.  I often add '--reject' which will apply the patch even if there are problems, and create .rej files for hand patching.

In both cases: Check for .rej and .orig files where patch may have failed.  Manually fix the working version and delete these extra files.

REPORTED VERSION CONFLICTS

Since the patches do not change anything other than the code modified by the update, there is some text which will not be removed by the patches.  In particular, drupal docroots which were originally 'packed' by the drupal packing script include version number information in the core module .info files.  Git versions of drupal do not include this version information.  These patches are based off of git releases, and so do not necessarily modify the .info files.  As a result, drush and the update module will MISREPORT version numbers. 

The packing script version information is not required to ascertain the correct version number of the drupal install, which is also in the system.module.  Scripts exist to simply remove this information.  This can be done by running 'rmv_dpl-version_nums.sh'.  Use as you see fit.