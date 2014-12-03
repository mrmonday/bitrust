#!/bin/sh

set -x

cd $(dirname $0)

git submodule update --remote --merge

cd rust

echo '<pre>' > ../index.html
git log -n100 --grep '\[breaking-change\]' >> ../index.html
echo '</pre>' >> ../index.html

cd ..

git commit --author='BitRust Bot'  -am 'Automatic update'
git push origin gh-pages
