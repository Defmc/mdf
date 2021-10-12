actual_dir=cwd

git clone https://github.com/Defmc/mdf mdf

#cp -rf mdf/* ~

for dir in ~/apps/*/; do
    cd $dir
    echo "\e[97m\e[1mCompiling $dir...\e[0m\e[39m"
    ./build.sh
    echo "\e[32m\e[1mBuild completed\e[0m\e[39m"
done

rm -rf ~/.git
cd $actual_dir
