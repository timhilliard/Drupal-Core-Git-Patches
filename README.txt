OVERVIEW

This series of patches allows for incremental upgrades between drupal versions. The patches modify only the files affected by the upgrade, and leave all other files untouched.

USAGE

The patches are labeled in two ways: version_to_version, and single version.  Single versions are incremental patches from the version which precedes to the version in the title (i.e., 6.11 is 6.10 to 6.11). These patches MUST be applied incrementally, you cannot jump version numbers.  So, 6.10 to 6.11 is fine, 6.10 to 6.22 is NOT FINE.  Be sure to apply the patch which corresponds to your distribution of drupal (at this time, only drupal 'vanilla' and pressflow, and one cocomore). 

Version_to_version patches are just that, and include are the versions in between.  This can mean a variety of bug-fixes and new features to work through in testing, but is much faster than the incremental patches.

There are a few patches for moving from drupal to pressflow.  They seem to work fine, so far.

Patches must be run for a git-initialized drupal (pressflow, etc.) version.  See below for step-by-step instructions.

Core Module Version # conflicts:

Since the patches do not change anything other than the code modified by the update, there is some text which will not be removed by the patches.  In particular, drupal docroots which were originally 'packed' by the drupal packing script include version number information in the core module .info files.  Git versions of drupal do not include this version information.  These patches are based off of git releases, and so do not necessarily modify the .info files.  As a result, drush and the udpate module will MISREPORT version numbers. 

The packing script version information is not required to ascertain the correct version number of the drupal install, which is also in the system.module.  Scripts exist to simply remove this information.  This can be done by running 'rmv_dpl-version_nums.sh'.  Most often, it is best to run this script BEFORE the patch.  Use as you see fit.

Step-by-Step 

1.  If your docroot is NOT already under git version control initialize your docroot as a git repository: run 'git init' from the top-level of the docroot
2.  Optional.  If your docroot is NOT managed by git and you want to see files changed, add the status of all current files to Git: run 'git add .'
3.  Optional. (no need for pressflow...): run rmv_dpl-version_nums.sh
4.  Optional. Commit this initial version: git commit -m "Remove version numbers for core module .info files"
5.  Apply the patch: git apply -v --ignore-whitespace /path/to/patches/drupal/drupal-7.10.patch
6.  Commit the changes: git commit -am "Commit Message"
7.  Optional. If you are doing multiple steps and want to be able to easily go back, it helps to create a git tag, git tag -a v# -m "Message" 
8.  Optional: If you are on SVN and doing multiple steps, commit to SVN repo as well.
9.  Optional: Rinse and repeat 5-7 for subsequent updates.
10.  Optional: Remove .git folder (from docroot): rm -r .git.  SVN will simply ignore the folder if you never add it.
11.  If your docroot is a part of a larger git-controlled group of folders, at this point, you need to add and commit files changed/added by the patch: 'git add .' and 'git commit -m "commit message"