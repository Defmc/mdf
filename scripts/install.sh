red_col="\e[31m"
green_col="\e[32m"

pprint(){
    printf "$2\e[1m$1\e[0m\e[39m"
}

actual_dir="$(pwd)"

git clone https://github.com/Defmc/mdf mdf

#cp -rf mdf/* ~

for dir in ~/apps/*/; do
    cd $dir
    pprint "Compiling $dir..." $red_col
    ./build.sh &> /dev/null
    pprint " Builded!" $green_col
done

rm -rf ~/.git
cd $actual_dir
