#!/usr/bin/env sh
apk add --no-cache curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fish_add_path ~/.cargo/bin