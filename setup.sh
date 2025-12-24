#!/usr/bin/env bash
echo "Current directory: $(pwd)"
rm -r ./.devcontainer/
cp -r "./devcontainers/$1/" ./