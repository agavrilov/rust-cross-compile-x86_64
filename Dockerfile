FROM agavrilov01/cross-compile-x86_64

ENV RUSTUP_TOOLCHAIN=1.41.0 \
    RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path --profile minimal --default-toolchain $RUSTUP_TOOLCHAIN

# Add Windows, OSX and Linux MUSL toolchains
RUN rustup target add x86_64-pc-windows-gnu x86_64-apple-darwin x86_64-unknown-linux-musl

# Copy cross-compilation scripts
COPY usr /usr/

#VOLUME ["$CARGO_HOME/registry"]
