source ~/.cargo/env

export EDITOR=nvim
export RUSTC_WRAPPER=/home/me/.cargo/bin/cachepot
export RUSTC_FLAGS='-C linker-flavor=mold'
alias rustlint="cargo clippy -- -A clippy::pedantic -A clippy::nursery -A clippy::cargo"
