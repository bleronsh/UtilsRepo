#!/bin/bash

# Set the name of your release branch (e.g. "release-v1.0")
RELEASE_BRANCH_NAME="release-v1.0"

# List of repositories to create release branches in
REPOSITORIES=("2" "22")

# Clone the script repository
git clone git@github.com:bleronsh/UtilsRepo.git
cd script-repository

# Loop through the list of repositories and create release branches
for repo in "${REPOSITORIES[@]}"
do
    # Clone the repository if it doesn't exist locally
    if [ ! -d "$repo" ]
    then
        git clone git@github.com:bleronsh/"$repo".git
    fi

    # Change directory to the repository
    cd "$repo"

    # Checkout to your main branch (e.g. "main" or "master")
    git checkout main

    # Pull the latest changes from the main branch
    git pull origin main

    # Create a new release branch from the main branch
    git branch "$RELEASE_BRANCH_NAME"

    # Checkout to the new release branch
    git checkout "$RELEASE_BRANCH_NAME"

    # Push the new release branch to the remote repository
    git push origin "$RELEASE_BRANCH_NAME"

    # Change directory back to the script repository
    cd ..
done
