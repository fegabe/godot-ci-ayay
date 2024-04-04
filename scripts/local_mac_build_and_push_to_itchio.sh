#!/usr/bin/env bash

# This is script is compiling in debug instead of relaease because FMOD is not working in release mode for mac.. yet

PLATFORM=osx
OUTPUT_FILE=./builds/osx/godot-ci-ayay.dmg
ITCHIO_USERNAME=taletronic
ITCHIO_GAME=godot-ci-ayay

# check if git status is not clean, abort
if [ -n "$(git status --porcelain)" ]; then
  printf "⛔️⛔️ Git status is not clean, aborting ⛔️⛔️\n"
  return 1
fi

# strip the output path from output file
EXPORT_PATH=$(dirname $OUTPUT_FILE)

printf "Building for platform: $PLATFORM\n"
printf "Output file: $OUTPUT_FILE\n"
printf "Export path: $EXPORT_PATH\n"
printf "Itch.io username: $ITCHIO_USERNAME\n"
printf "Itch.io game: $ITCHIO_GAME\n"

# quick and dirty way to update the version number, not corresponding with other platform builds
LATEST_TAG=$(git describe --tags --abbrev=0)
COMMITS=$(git rev-list --count HEAD)
VERSION="$LATEST_TAG.$COMMITS"
sed -i '' 's/config\/version=".*"/config\/version="'"$VERSION"'"/' project.godot

rm -rf $EXPORT_PATH
mkdir -p $EXPORT_PATH
# godot --verbose --export-release --headless "$PLATFORM" $OUTPUT_FILE
godot --verbose --export-debug --headless "$PLATFORM" $OUTPUT_FILE
butler push $EXPORT_PATH $ITCHIO_USERNAME/$ITCHIO_GAME:$PLATFORM

printf "✅✅ Build and push to itch.io version $VERSION for completed! ✅✅\n"