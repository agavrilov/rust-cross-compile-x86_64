# rust-cross-compile-x86_64

[Docker image](https://github.com/agavrilov/rust-cross-compile-x86_64/pkgs/container/rust-cross-compile-x86_64) for cross-compilation Rust programs for Linux, Windows and macOS.

Following toolchains are installed:
* x86_64-apple-darwin
* x86_64-pc-windows-gnu
* x86_64-unknown-linux-musl

## Usage

Run the following command in the directory where your Cargo.toml is located.

```
docker run --rm \
    -v cargo_registry:/usr/local/cargo/registry \
    -v cargo_git:/usr/local/cargo/git \
    -v "$(pwd):/work" \
    -w=/work \
    agavrilov01/rust-cross-compile-x86_64 \
    cross-cargo.sh \
    [your Cargo parameters...]
```

Make sure you specified the target you want to build for. For example, to build for macOS, specify
```
--target=x86_64-apple-darwin
```

There is a convienence [script](https://github.com/agavrilov/rust-cross-compile-x86_64/blob/master/cargo-in-container.sh) which wraps this command for you. With this script, the example above will become:
```
./cargo-in-container.sh build --target=x86_64-apple-darwin
```