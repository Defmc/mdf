# Binary Optimizer
opt(){
    strip $1
    upx $1
}

# Cargo's export and formatter
ce(){
    cargo fmt --all
    cargo build --release
    opt "target/release/${PWD##*/}"
    time "target/release/${PWD##*/}"
}

alias cfa="cargo fmt --all"
alias crr="cfa && cargo run --release"
alias crd="cfa && cargo run"
alias cbe="cfa && cargo bench"
alias cbr="cfa && cargo build --release"
alias cbd="cfa && cargo build"
alias cf="cfa && cargo flamegraph"
alias cu="cfa && cargo update"
