# devcon-alp
Personal Alpine Linux devcontainer config of `ScatteredCognition`

## Using the image
To use this devcontainer image, run the following commands in your project's root, then create the devcontainer as you normally would using VSCode/DevPods.  

```bash
git submodule add 'https://github.com/ScatteredCognition/devcon-alp.git'
./devcon-alp/setup.sh
```

## Details
- Uses the [docker.io/library/alpine:latest](https://hub.docker.com/_/alpine/) image as a base  
- Size is around 50MB~  
- Uses the `fish` shell as default  
- Included packages  
    - `doas` w/ sudo shim 
        - paswordless root access enabled for users in `wheel` group
    - `shadow`
    - `fish`
    - `git`
    - `curl`
    - `nano`/`micro`
    - `pfetch-rs`
    - `host-spawn` (symlinked to `hpwn`)

> NOTE: All Environment Variables for different utilities are configured for the `fish` shell  
> NOTE: Includes `vscode` user/group with UID/GID 1000 for compatibility with DevPod and other tools

## Helper tools
- `devcon-help`:
    - displays available helper tools
- `setup-java`: 
    - installs `openjdk8` package
    - will make it configurable at a later date
- `setup-rust`:
    - installs `build-base` and `rustup` packages
    - sets `RUSTUP_HOME` to `/rustup`
    - sets `CARGO_HOME` to `/cargo`
    - adds `$CARGO_HOME/bin` to `$PATH`
    - launches `rustup-init --no-modify-path`
- `jvrn`:
    - simple wrapper that compiles and runs `.java` files and cleans up compiled `.class` files afterwards