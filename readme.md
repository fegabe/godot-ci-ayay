# Setup Github

In order to upload the build to itch.io, go here https://github.com/YOUR_USERNAME/godot-ci-ayay/settings/secrets/actions/new and create a new secret:

* key: `BUTLER_API_KEY`
* value: go here https://itch.io/user/settings/api-keys and create a new key

# Setup project

## 1. You need to download fmod library

### mac/linux

Run next script:

`$ ./scripts/download_fmod_library.sh`

### windows:

Download the library https://github.com/utopia-rise/fmod-gdextension/releases/download/4.1.0-4.2.0/addons.zip and unzip it under `addons/fmod/`

## 2. Check that fmod plugin is enabled at Project Settings -> Plugins

## 3. Restart the project (Godot will ask for it)

And have shout! 😱
