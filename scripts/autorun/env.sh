source ~/.cargo/env

export EDITOR=nvim
rusttest() {
  echo "fn main() {\n   println!(\"Hello world\")\n}" >> test.rs
  nvim test.rs
  rustc test.rs
  ./test
  rm test.rs
  rm test
}
