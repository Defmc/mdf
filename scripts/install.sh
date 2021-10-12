actual_dir = cwd

git clone https://github.com/Defmc/mdf mdf

cp -rf mdf/* ~

for dir in ~/apps/*/; do
    cd $dir
    echo "Compiling $dir..."
    ./build.sh
done

rm -rf ~/.git
cd $actual_dir
