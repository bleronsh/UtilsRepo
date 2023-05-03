#!/usr/bin/env bash

# Set the name of your release branch (e.g. "release-v1.0")
RELEASE_BRANCH_NAME=$1
# List of repositories to create release branches"
repos="22 2"
# Loop through the list of repositories and create release branches
git config --global credential.helper store

for repo in $repos
do
  git clone "https://github.com/bleronsh/$repo.git"
  git config --global credential.helper store
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
  rm -rf $repo
done