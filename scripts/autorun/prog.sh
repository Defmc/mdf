source ~/scripts/ui_tools.sh

# Binary Optimizer
opt() {
	printf "$FG_RED%s\"%s\"...\n" "Optimizing " $1
	log_proc "strip $1" "Stripping"
	log_proc "upx $1" "Packing"
}

rce() {
	log_proc "cross build --release --target x86_64-pc-windows-gnu" "Building for Windows (GNU)"
	log_proc "cross build --release --target x86_64-unknown-linux-gnu" "Building for Linux (GNU)"
	log_proc "cross build --release --target x86_64-unknown-linux-musl" "Building for Linux (MUSL)"
}

alias co="cargo"
