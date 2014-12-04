#!/bin/sh

set -x

cd $(dirname $0)

git pull origin gh-pages
./update.sh
