#!/usr/bin/env bash

# Set the path to your dotfiles repository
DOTFILES_REPO="$HOME/.dotfiles"

# Set the URL of your GitHub repository
GITHUB_REPO="https://github.com/Ebotian/.dotfiles.git"

# Change to the dotfiles repository directory
cd "$DOTFILES_REPO"

# Move all dotfiles from $HOME to the repository
find $HOME -maxdepth 1 -type f -iname '.*' | xargs -I {} mv {} "$DOTFILES_REPO"

# Create symbolic links for all dotfiles in the repository
find "$DOTFILES_REPO" -maxdepth 1 -type f -iname '.*' -exec ln -sf {} $HOME \;

# Add all changes to the repository
git add --all

# Commit the changes with a message containing the current date and hostname
git commit -m "dotfiles_$(date +%Y-%m-%d) from $(whoami)@$(hostname)"

git pull "$GITHUB_REPO" main
# Push the changes to the GitHub repository
git push "$GITHUB_REPO" main
