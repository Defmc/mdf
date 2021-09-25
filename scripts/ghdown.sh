if [[ $# -lt 1 ]]; then
	echo "GitHub file DOWNloader"
	echo "Usage: ghdown [user]/[repo]/[branch]/[filepath]"
else
	curl https://raw.githubusercontent.com/$1
fi
