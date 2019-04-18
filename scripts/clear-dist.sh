#!/bin/bash

# Start in scripts/ even if run from root directory
cd "$(dirname "$0")"

# Exit the script on any command with non 0 return code
# We assume that all the commands in the pipeline set their return code
# properly and that we do not need to validate that the output is correct
set -e

# Echo every command being executed
set -x

# Go to root
cd ..
# root_path=$PWD

if [ ! -d "./dist" ]; then
  mkdir dist
  exit 0
fi

cd ./dist

# List files inside dist/ separated by spaces
things_inside_dist="$(ls -A | tr '\n' ' ')"

# Remove all files and folders inside dist/, but keep the folder itself
# as a clue to what webpack + netlify are doing
if [ -n "$things_inside_dist" ]; then
  rm -rf $things_inside_dist
  cd ..
  git add "./dist"
fi