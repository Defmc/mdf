#!/bin/sh
# Adds an ideia to the final of `README.md` in the current git repository
#
# Args:
#   - 1: The text


root=$(git rev-parse --show-toplevel)
readme="$root/README.md"
echo "$readme"

if [ ! -f "$readme" ]; then
    echo "Ideias:" > "$readme"
fi

echo "- $1" >> "$readme"
git commit -m "feat(chore): add new ideia" "$readme"
