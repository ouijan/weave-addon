#!/bin/bash
PROJECT_PATH="."
ADDON_NAME="Weave"
SRC="$PROJECT_PATH/src/"
ADDONS_FOLDER="/Applications/World of Warcraft/_classic_/interface/addons"
TARGET_DIR="$ADDONS_FOLDER/$ADDON_NAME"
rsync -rt --delete "$SRC" "$TARGET_DIR"
