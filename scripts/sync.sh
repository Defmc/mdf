rm -rf ~/dev/mdf
git clone https://github.com/Defmc/mdf ~/dev/mdf

for p in $(exa --all ~/dev/mdf); do
  if [ $p != "." ] && [ $p != ".." ]; then
    rm -rf ~/$p
    cp -r ~/dev/mdf/$p ~/$p
  fi
done
