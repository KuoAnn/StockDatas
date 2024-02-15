#!/bin/bash

script_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

default_repository_path="$script_directory"

repository_path=${1:-$default_repository_path}

cd "$repository_path" || exit 1

git pull

changes=$(git status --porcelain)
if [ -n "$changes" ]; then
    git add .
    git commit -m "auto sync"
    git push
    echo "Update to date"
else
    echo "No need to update"
fi
