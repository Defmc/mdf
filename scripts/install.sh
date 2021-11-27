red_col="\e[31m"
green_col="\e[32m"

pprint() {
	printf "$2\e[1m$1\e[0m\e[39m"
}

actual_dir="$(pwd)"

git clone https://github.com/Defmc/mdf mdf

pprint "Copiando arquivos..." $red_col
cp -rf mdf/* ~
pprint " Pronto!\n" $green_col

for dir in ~/apps/*/; do
	cd $dir
	pprint "Compilando $dir..." $red_col
	./build.sh &
	>/dev/null
	pprint " Construído!\n" $green_col
done

pprint "Apagando arquivos inúteis..." $red_col
rm -rf ~/.git
pprint " GG!\n" $green_col
cd $actual_dir
pprint "Bodia amdrade gostosa\n" $green_col
