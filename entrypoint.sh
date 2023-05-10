#!/bin/sh
sh -c "python3 /data/main.py $*"
git add $1
git config user.email 41898282+github-actions[bot]@users.noreply.github.com
git config user.name "GitHub Actions[Bot]"
# Push only if README.md has been modified
if [[ $(git status --porcelain "$1" | wc -l) -gt 0 ]]; then git commit -m "[BOT] Update $1"; git push; fi
