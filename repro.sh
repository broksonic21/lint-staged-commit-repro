#!/bin/bash

if ! git diff-index --quiet HEAD -- || [ -n "$(git ls-files --others --exclude-standard)" ]; then
  echo "Error: git working directory is not clean. Aborting."
  exit 1
fi

echo "This git status should be clean"
git status

echo "Adding a console.log with an prettier error/cleanup in it" 
echo "console.log( now);" >> test-file.js

echo "This git status should have one unstaged file"
git status

echo "Git commit without a git add first, still calls precommit/lint-staged"
git commit -m "Add console.log" .

echo "This git status will usually have one unstaged file, one staged"
git status

