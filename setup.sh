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

# Ask local build or pull from ghcr
printf "Choose devcontainer mode:\n1) Build locally\n2) Pull from GHCR\nEnter choice [1/2]: "
while :; do
    read -r BUILD_MODE

    case "$BUILD_MODE" in
        1|2)
            break
            ;;
        *)
            echo "Invalid option. Please enter 1 or 2."
            ;;
    esac
done

# Remove old dirs
if rm -rf "$BASEDIR/.devcontainer"; then
    echo "Removed old .devcontainer directory"
else
    echo "Failed to remove old .devcontainer directory"
    echo "Exiting..."
    exit 1
fi

# Copy the new files
if [ "$BUILD_MODE" = "1" ]; then
    if cp -r "$BASEDIR/$CONNAME/src/" ./.devcontainer/; then
        echo "Copied files to .devcontainer directory"
        echo "Configured devcontainer for local build"
        echo "Please rebuild and reopen your devcontainer from VSCode"
    else
        echo "Failed to copy files to .devcontainer directory"
        echo "Exiting..."
        exit 1
fi


# GHCR-specific override (ADDED)
if [ "$BUILD_MODE" = "2" ]; then
    if cp "$BASEDIR/$CONNAME/ghcr/devcontainer.json" ./.devcontainer/devcontainer.json; then
        echo "Configured devcontainer to pull from GHCR"
        echo "Please rebuild and reopen your devcontainer from VSCode"
    else
        echo "Failed to configure GHCR devcontainer"
        exit 1
    fi
fi
    