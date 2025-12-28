# devcontainers
Personal devcontainer configs of `ScatteredCognition`
To use, run the following command in your project's root directory depending on which devcontainer you want.

## Base
```bash
git submodule add 'https://github.com/ScatteredCognition/devcontainers.git'
chmod +x ./devcontainers/setup.sh && ./devcontainers/setup.sh base
```

## Java 8
- In the created container, run:
```bash
setup-java
```

## Rust
- In the created container, run:
```bash
setup-rust
```
