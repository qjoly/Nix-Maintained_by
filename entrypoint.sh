#!/bin/sh
echo 'Configuration Git'
git config --global --add safe.directory /github/workspace
git config --global user.email 41898282+github-actions[bot]@users.noreply.github.com
git config --global user.name "GitHub Actions[Bot]"
echo 'Starting Python script'
sh -c "python3 /data/main.py $*"
git add $1

echo 'Git push if file has been modified'
# Push only if README.md has been modified
if [[ $(git status --porcelain "$1" | wc -l) -gt 0 ]]; then git commit -m "[BOT] Update $1"; git push; fi
