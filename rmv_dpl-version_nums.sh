#Script removes drupal packing script info from core module and theme info files. 
# run on older version of drupal, BEFORE applying patches.  
# This does not remove Acquia Drupal packing information.
#
# must: chmod +x ~/rmv_version_nums.shn (makes executable)
#
# - @mariagwyn with the  help of greggles.
sed -i '' 's/; Information added by drupal.org packaging script on [0-9]*-[0-9]*-[0-9]*//g' modules/*/*.info themes/*/*.info themes/tests/*/*.info
sed -i '' 's/version = "[0-9]*.[0-9]*"//g' modules/*/*.info themes/*/*.info themes/tests/*/*.info
sed -i '' 's/project = "drupal"//g' modules/*/*.info themes/*/*.info themes/tests/*/*.info
sed -i '' 's/datestamp = "[0-9]*"//g' modules/*/*.info themes/*/*.info themes/tests/*/*.info
sed -i '' '/^$/d' modules/*/*.info themes/*/*.info themes/tests/*/*.info
echo "Version numbers removed"