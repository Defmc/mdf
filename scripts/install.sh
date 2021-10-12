actual_dir="$(cwd)"

git clone https://github.com/Defmc/mdf mdf

#cp -rf mdf/* ~

for dir in ~/apps/*/; do
    cd $dir
    printf "\e[31m\e[1mCompiling $dir...\e[0m\e[39m\n"
    ./build.sh &> /dev/null
    printf "\e[32m\e[1mBuild completed!\e[0m\e[39m\n\n"
done

rm -rf ~/.git
cd $actual_dir
