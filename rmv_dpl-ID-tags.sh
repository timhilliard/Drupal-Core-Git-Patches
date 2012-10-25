#Script removes drupal packing script info from core module and theme info files. 
# run on older version of drupal, BEFORE applying patches.  
# This does not remove Acquia Drupal packing information.
#
# must: chmod +x ~/rmv_dpl-ID-tags.sh (makes executable)
#
# - @mariagwyn with the  help of greggles.

find . -name '*.txt' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$$/\/\/ \$Id\$/' {} \;
find . -name '*.info' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$$/\; \$Id\$/' {} \;
find . -name '*.inc' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$$/\/\/ \$Id\$/' {} \;
find . -name '*.php' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$$/\/\/ \$Id\$/' {} \;
find . -name '*.css' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$ \*\/$/\/\* \$Id\$ \*\//' {} \;
find . -name '*.js' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$$/\/\/ \$Id\$/' {} \;
find . -name '*.module' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$$/\/\/ \$Id\$/' {} \;
find . -name '*.profile' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$$/\/\/ \$Id\$/' {} \;
find . -name '*.pl' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$$/\/\/ \$Id\$/' {} \;
find . -name '*.install' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$$/\/\/ \$Id\$/' {} \;
find . -name '*.theme' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$$/\/\/ \$Id\$/' {} \;
find . -name '*.sh' -not -path './modules/acquia*' -not -path './sites*' -not -path './themes/acquia*' -not -path './metadata*' -not -path './profiles/acquia*' -exec sed -i '' 's/.*\$Id:.* Exp \$$/\# \$Id\$/' {} \;
sed -i '' 's/.*\$Id:.* Exp \$$/\/\/ \$Id\$/' sites/default/default.settings.php sites/all/README.txt
echo "Modified ID formatting"