#!/usr/bin/env bash

VERSION=$1

if [ -z "$VERSION" ]; then
  printf "No version number provided\n"
  exit 1
fi

printf "Updating version number to $VERSION\n"

# update project.godot
sed -i 's/config\/version=".*"/config\/version="'"$VERSION"'"/' project.godot

printf "Version number updated to $VERSION\n"
printf "project.godot:\n"
printf "================\n"
cat project.godot
