#!/usr/bin/env sh

BASE_PATH=$(pwd);

ZH_CN_README="$BASE_PATH/README.md"
EN_README="$BASE_PATH/README.en.md"

# Remove Readme files
rm "$ZH_CN_README"
rm "$EN_README"

# Create new files
touch "$ZH_CN_README"
touch "$EN_README"

# Concat zh-CN files
for file in ./docs/zh-CN/*.md; do
  cat $file >> "$ZH_CN_README";
  echo '\n' >> "$ZH_CN_README";
done;

if [ -f README.html ]; then mv README.html index.html; fi;
if [ -f README.en.html ]; then mv README.en.html index.html; fi;

sed -i "" "s/{:.no_toc}//g" README.md
sed -i "" "s/+ toc-list/<!-- START doctoc -->/g" README.md
sed -i "" "s/{:toc}/<!-- END doctoc -->/g" README.md

npx doctoc README.md
