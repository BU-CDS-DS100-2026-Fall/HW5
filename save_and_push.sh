#!/usr/bin/env bash
set -euo pipefail

notebook="${1:-hw05.ipynb}"

if [[ ! -f "$notebook" ]]; then
  echo "Could not find $notebook. Ask course staff for help."
  exit 1
fi

git add -- "$notebook"

if git diff --cached --quiet -- "$notebook"; then
  echo "No new saved notebook changes were found."
else
  git commit -m "Save Homework 5" -- "$notebook"
fi

git push
echo "Homework 5 was pushed to GitHub successfully."
git status --short --branch
