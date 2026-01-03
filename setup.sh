#!/usr/bin/env sh
echo "Current directory: $(pwd)"
CONNAME=devcon-alp

if [ -f ./"$CONNAME"/src/.devcon-alp ]; then
    BASEDIR=$(pwd)
elif [ -f ./src/."$CONNAME" ]; then
    cd .. && BASEDIR=$(pwd)
else
    echo "Can't find files, please run from project or submodule root directory"
    exit 1
fi

# Remove old dirs
if rm -rf "$BASEDIR/.devcontainer"; then
    echo "Removed old .devcontainer directory"
else
    echo "Failed to remove old .devcontainer directory"
    echo "Exiting..."
    exit 1
fi

# Copy the new files
if cp -r "$BASEDIR/$CONNAME/src/" ./.devcontainer/; then
    echo "Copied files to .devcontainer directory"
else
    echo "Failed to copy files to .devcontainer directory"
    echo "Exiting..."
    exit 1
fi