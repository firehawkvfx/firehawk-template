#!/bin/sh


if [ ! -z "$1" ]; then
    base_path="$1"
    echo "Clone template into: $base_path"
    git clone https://github.com/firehawkvfx/firehawk-template.git $base_path
    cd $base_path
    git submodule update --init --recursive
    cd firehawk
    git checkout master
    git pull
    git submodule update --init --recursive
    cd ..
    git checkout -b dev
    git commit -am "Pulled update to firehawk submodule dir"
    git remote remove origin
    remotes=$(git remote -v)
    [ ! -z "$remotes" ] && echo "Error: Remotes still exist, do not continue until they are removed.  You may use your own private git remote repo, but it must not be public." || echo "Firehawk initialised on branch 'dev'"
else
    echo "Please provide a name for the path to clone into."
fi