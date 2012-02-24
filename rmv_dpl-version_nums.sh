#Script removes drupal packing script info from core module and theme info files. 
# run on older version of drupal, BEFORE applying patches.  
# This does not remove Acquia Drupal packing informatoin.
# - @mariagwyn with the  help of greggles.
sed -i '' 's/; Information added by drupal.org packaging script on [0-9]*-[0-9]*-[0-9]*//g' modules/*/*.info themes/*/*.info
sed -i '' 's/version = "[0-9]*.[0-9]*"//g' modules/*/*.info themes/*/*.info
sed -i '' 's/project = "drupal"//g' modules/*/*.info themes/*/*.info
sed -i '' 's/datestamp = "[0-9]*"//g' modules/*/*.info themes/*/*.info
sed -i '' '/^$/d' modules/*/*.info themes/*/*.info