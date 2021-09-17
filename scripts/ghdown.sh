# Params
# 1st: User
# 2nd: Repository
# 3th: Branch
# 4th: Repo Filepath
# 5th: Local Filepath

if [[ $# -lt 5 ]]; then
	echo "GitHub file DOWNloader"
	echo "Usage: ghdown [user] [repo] [branch] [filepath] [destiny]"
	printf "[user]: %20s The user account with the repo\n"
	printf "[repo]: %20s The repository (without branch)\n"
	printf "[branch]: %18s The repository branch\n"
	printf "[filepath]: %16s The filepath from repository\n"
	printf "[destiny]: %17s The local to save\n"
else
	curl https://raw.githubusercontent.com/$1/$2/$3/$4 > $5
fi
