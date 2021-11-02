source ~/scripts/ui_tools.sh

# Binary Optimizer
opt(){
    printf "$FG_RED%s\"%s\"...\n" "Optimizing " $1
    log_proc "strip $1" "Stripping"
    log_proc "upx $1" "Packing"
}

# Cargo's export and formatter
ce(){
    cargo fmt --all
    cargo build --release
    opt "target/release/${PWD##*/}"
    hyperfine "./target/release/${PWD##*/}"
}

alias cfa="cargo fmt --all"
alias crr="cfa && cargo run --release"
alias crd="cfa && cargo run"
alias cbe="cfa && cargo bench"
alias cbr="cfa && cargo build --release"
alias cbd="cfa && cargo build"
alias cf="cfa && cargo flamegraph"
alias cu="cfa && cargo update"
