source ~/scripts/ui_tools.sh
rxfetch

for file in $(exa ~/scripts/autorun); do
    source ~/scripts/autorun/$file
    log_proc "" "Sourcing $file"
done
