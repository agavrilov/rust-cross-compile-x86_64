FROM ghcr.io/agavrilov/cross-compile-x86_64:1.0.0

ENV RUSTUP_TOOLCHAIN=1.56.1 \
    RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path --profile minimal --default-toolchain $RUSTUP_TOOLCHAIN

# Add toolchains:
#   x86_64 - Windows, macOS, Linux
#   ARM - macOS
RUN rustup target add x86_64-pc-windows-gnu x86_64-apple-darwin x86_64-unknown-linux-musl aarch64-apple-darwin

# Copy cross-compilation scripts
COPY usr /usr/

#VOLUME ["$CARGO_HOME/registry"]
