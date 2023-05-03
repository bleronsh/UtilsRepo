#!/usr/bin/env bash

# Set the name of your release branch (e.g. "release-v1.0")
RELEASE_BRANCH_NAME="release-v1.3"
GIT_TOKEN="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"
# List of repositories to create release branches"
repos="22 2"

# Loop through the list of repositories and create release branches
# Clone the repository if it doesn't exist locally
for repo in $repos
do
  if [! -d "$repo"]
  then
    git clone "https://$GIT_TOKEN@github.com/bleronsh/$repo.git"
  fi
# Change directory to the repository
  cd "$repo"

    # Checkout to your main branch
  git checkout main

    # Pull the latest changes from the main branch
  git pull origin main

    # Create a new release branch from the main branch
  git branch "$RELEASE_BRANCH_NAME"

    # Checkout to the new release branch
  git checkout "$RELEASE_BRANCH_NAME"

     # Push the new release branch to the remote repository
  git push origin "$RELEASE_BRANCH_NAME"
  cd ..
done
# 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