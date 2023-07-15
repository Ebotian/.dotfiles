#!/usr/bin/env bash

# Set the path to your dotfiles repository
DOTFILES_REPO="$HOME/.dotfiles"

# Set the URL of your GitHub repository
GITHUB_REPO="https://github.com/Ebotian/.dotfiles.git"


# Change to the dotfiles repository directory
cd "$DOTFILES_REPO"
# connect to github
ssh -T git@github.com
# Clone sub git repo
rmdir .oh-my-zsh;git clone git@github.com:Ebotian/.oh-my-zsh.git
rmdir .zsh-vi-mode;git clone https://github.com/jeffreytse/zsh-vi-mode.git .zsh-vi-mode
# Create symbolic links for all dotfiles in the repository
find $DOTFILES_REPO -maxdepth 1 -type d,f -iregex '^.*dotfiles/\.[^git].*$' -exec ln -sf {} $HOME \;
ln -sf $(pwd)/.gitconfig $HOME

# Move all dotfiles from $HOME to the repository
find $HOME -maxdepth 1 -type f -iregex "^.*$HOME/\..+$" | xargs -I {} mv {} "$DOTFILES_REPO"
# {} is used for arguments replace, xargs pass stdin to `{}` referred by its argument `-I` and replace `{}` in the later `mv`'s argument
# {} is replaced by the current file name). The \; at the end of the command is used to terminate the -exec expression
# log plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Add all changes to the repository
git add --all

# Commit the changes with a message containing the current date and hostname
git commit -m "dotfiles_$(date +%Y-%m-%d) from $(whoami)@$(hostname)"

git pull
# Push the changes to the GitHub repository
git push
# Add `source "$HOME/.dotfiles/sync.sh"` to .zshrc and .bashrc
# Dose "dotdirectory" should also be sync?
# how to push to github?
# 1. sign in github
# 2. create a new repository(with license and readme)
# 3. git clone it to local
# 4. run the shell script to get all things done
# 5. check if everything goes right
# find and remove broken symbolinks
find $HOME -xtype l -delete
