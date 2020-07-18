#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    branch='master'
else
    branch="$1"
fi
echo "Using branch $branch"

git submodule update --init --recursive
cd firehawk
git checkout $branch
git pull
git submodule update --init --recursive
cd ..
git checkout -b dev
git commit -am "Pulled update to firehawk submodule dir"
git remote remove origin
remotes=$(git remote -v)
[ ! -z "$remotes" ] && echo "Error: Remotes still exist, do not continue until they are removed.  You may use your own private git remote repo, but it must not be public." || echo "Firehawk initialised on branch 'dev'"