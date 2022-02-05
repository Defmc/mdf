source ~/.cargo/env

export EDITOR=nvim
export RUSTC_WRAPPER=/home/me/.cargo/bin/cachepot
#export CACHEPOT_LOG=debug
export RUSTC_FLAGS='-C link-arg=-fuse-ld=lld'
