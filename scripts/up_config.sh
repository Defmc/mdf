#!/bin/sh

. "$HOME/scripts/ui_tools.sh"

up_file() {
  mkdir -p "$HOME/dev/mdf/$1"
  log_proc "cp -r $HOME/$1/$2 $HOME/dev/mdf/$1/$2" "Copying $HOME/$1/$2"
}

root_up_file() {
  mkdir -p "$HOME/dev/mdf/$1"
  log_proc "cp -r /$1/$2 $HOME/dev/mdf/$1/$2" "Copying /$1/$2"
}

up_files() {
  up_file . .Xresources &
  up_file . .xinitrc &
  up_file .icons . &
  up_file . .zshrc &
  up_file . .gtkrc-2.0 &
  up_file .config gtk-3.0 &
  up_file .config/picom picom.conf &
  up_file .config/nvim lua &
  up_file .config/nvim init.lua &
  up_file .config lemonbar &
  up_file .config polybar &
  up_file .config sxhkd &
  up_file .cargo config.toml &
  up_file .cargo env &
  up_file . scripts &
  up_file . .gdbinit &
  up_file .config bspwm &
  up_file img . &
  up_file .themes TokyoNight &
  up_file .oh-my-zsh/custom themes &
  root_up_file etc makepkg.conf &
  wait
}

up_git() {
  OLDDIR=$(pwd)
  cd "$HOME/dev/mdf" || exit
  git add -A .
  git commit -am "update dotfiles"
  git push origin main -f
  cd "$OLDDIR" || exit
}

rm_buff() {
  cp -r "$HOME/dev/mdf/.git" "$HOME/dev/.git"
  rm -rf "$HOME/dev/mdf"
  mkdir "$HOME/dev/mdf"
  mv "$HOME/dev/.git" "$HOME/dev/mdf/.git"
}

log_proc "rm_buff" "Removing old buffer"
up_files
up_git
