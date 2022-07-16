for file in $(exa ~/scripts/autorun); do
    source ~/scripts/autorun/$file
done

# bun
export BUN_INSTALL="/home/me/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
