FROM agavrilov01/cross-compile-x86_64

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

# Install necessary components
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl && \
    apt-get clean

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

# Add Windows, OSX and Linux MUSL toolchains
RUN rustup target add x86_64-pc-windows-gnu x86_64-apple-darwin x86_64-unknown-linux-musl

# Copy cross-compilation scripts
COPY usr /usr/

#VOLUME ["$CARGO_HOME/registry"]
