#!/bin/sh

set -x

cd $(dirname $0)

git submodule update --init --merge
git submodule foreach git pull origin master

cd rust

echo "<!DOCTYPE html><html><head>" > ../index.html
echo "<title>BitRust - Breaking Changes in rust-lang/rust</title>" >> ../index.html
echo '</head><body><pre>' >> ../index.html

git log -n100 --pretty=fuller --grep '\[breaking-change\]' \
  | sed -e 's/&/\&amp;/g' \
  | sed -e 's/</\&lt;/g' \
        -e 's/>/\&gt;/g' \
  >> ../index.html

echo '</pre></body></html>' >> ../index.html

cd ..

git commit --author='BitRust Bot <bitrustbot@octarineparrot.com>'  -am 'Automatic update'
git push origin gh-pages
