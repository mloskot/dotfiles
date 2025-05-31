#!/bin/bash
ME=$(basename "$0")
if [ $# -ne 2 ]; then
    echo "Usage: ${ME} <pull request number> <merge branch>"
    exit 1
fi
PR="${1}"
BR="origin/${2}"

if ! gh pr list | grep -P -o "^\b${PR}\b" > /dev/null; then
    echo "${ME} Pull request ${PR} not found. Aborting."
    exit 1
fi
if ! git show-branch "${BR}" > /dev/null 2>&1; then
    echo "${ME} Branch ${BR} not found. Aborting."
    exit 1
fi
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
git fetch origin
echo "${ME} Checking out PR ${PR}"
gh pr checkout "${PR}"
echo "${ME} Merging ${BR}"
git merge "${BR}"
PR_BR=$(git branch --show-current)
echo "${ME} Pushing to PR ${PR} branch ${PR_BR}"
# XXX: Remote tracking magic explained https://github.com/cli/cli/issues/2942#issuecomment-1007671372
git push
git switch -
echo "${ME} Deleting branch ${PR_BR}"
git branch -D "${PR_BR}"
#gh pr ready ${PR}
