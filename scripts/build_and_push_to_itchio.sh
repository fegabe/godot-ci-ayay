#!/usr/bin/env bash

PLATFORM=$1
OUTPUT_FILE=$2
ITCHIO_USERNAME=$3
ITCHIO_GAME=$4

# check for platform and output file
if [ -z "$PLATFORM" ] || [ -z "$OUTPUT_FILE" ] || [ -z "$ITCHIO_USERNAME" ] || [ -z "$ITCHIO_GAME" ]; then
  printf "Required parameters not provided\n. Usage: ./build_and_push_to_itchio.sh win ./Builds/win/godot-ci-ayay.exe taletronic godot-ci-ayay\n"
  exit 1
fi

# strip the output path from output file
EXPORT_PATH=$(dirname $OUTPUT_FILE)

printf "Building for platform: $PLATFORM\n"
printf "Output file: $OUTPUT_FILE\n"
printf "Export path: $EXPORT_PATH\n"
printf "Itch.io username: $ITCHIO_USERNAME\n"
printf "Itch.io game: $ITCHIO_GAME\n"

rm -rf $EXPORT_PATH
mkdir -p $EXPORT_PATH
godot --verbose --export-release --headless "$PLATFORM" $OUTPUT_FILE
butler push $EXPORT_PATH $ITCHIO_USERNAME/$ITCHIO_GAME:$PLATFORM