#Script removes drupal packing script info from core module and theme info files. - @acquia-MGM
sed -i '' 's/; Information added by drupal.org packaging script on [0-9]*-[0-9]*-[0-9]*//g' modules/*/*.info themes/*/*.info
sed -i '' 's/version = "[0-9]*.[0-9]*"//g' modules/*/*.info themes/*/*.info
sed -i '' 's/project = "drupal"//g' modules/*/*.info themes/*/*.info
sed -i '' 's/datestamp = "[0-9]*"//g' modules/*/*.info themes/*/*.info
sed -i '' '/^$/d' modules/*/*.info themes/*/*.info