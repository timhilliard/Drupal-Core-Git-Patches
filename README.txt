OVERVIEW

This series of patches allows for incremental upgrades between drupal versions. The patches modify only the files affected by the upgrade, and leave all other files untouched.

USAGE

Incremental application:

These patches MUST be applied incrementally, you cannot jump version numbers.  So, 6.10 to 6.11 is fine, 6.10 to 6.22 is NOT FINE.  Be sure to apply the patch which corresponds to your distribution of drupal (at this time, only drupal 'vanilla' and pressflow).  If you are planning to upgrade through through many versions, it is best to test each version upgrade on a running site.  These patches include bug-fixes which can affect the functionality of your site in sometimes unexpected ways.

Core Module Version # conflicts:

Since the patches do not change anything other than the code modified by the update, there is some text which will not be removed by the patches.  In particular, drupal docroots which were originally 'packed' by the drupal tarball packing script include in the core module .info files version number information.  This information is not required to ascertain the correct version number of the drupal install, which is also in the system.module.  If this information remains in the module .info files, the update module will register conflicting version numbers.  It is best to simply remove this information.  This can be done by running 'rmv_dpl-version_nums.sh'.  Most often, it is best to run this script BEFORE the patch.  Use as you see fit.

Step-by-Step 

1.  If your docroot is NOT already under git version control initialize your docroot as a git repository: run 'git init' from the top-level of the docroot
2.  Optional (if your docroot is NOT managed by git, and you want to see files changed), add the status of all current files to Git: run 'git add .'
3.  Optional (no need for pressflow...): run rmv_dpl-version_nums.sh
4.  Commit this (optional): git commit -m "Remove version numbers for core module .info files"
5.  Apply the patch: git apply -v --ignore-whitespace /path/to/patches/drupal/drupal-7.10.patch
6.  Optional, commit the changes: git apply -am "Commit Message"
7.  Optional: If you are doing multiple steps and want to be able to go back, it helps to create a git tag, git tag -a v# -m "Message" 
8.  Optional: If you are doing multiple steps, commit to SVN repo.
9.  Optional: Rinse and repeat 5-7 for subsequent updates.
10.  Optional: Remove .git folder (from docroot): rm -r .git.  SVN will simply ignore the folder if you never add it.
11.  If your docroot is a part of a larger git-controlled group of folders, at this point, you need to add and commit files changed/added by the patch: 'git add .' and 'git commit -m "commit message"