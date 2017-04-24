#!/bin/bash
# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Use colors for "ls"
alias ls="ls -G"

# Remove all .DS_Store files from directory recursively
alias dsstore-clean='find . -type f -name .DS_Store -delete'

# Brew Cask
export HOMEBREW_CASK_OPTS="--caskroom=/opt/homebrew-cask/Caskroom"

# Git completion
export GIT_COMPLETION_PATH=/usr/local/git/contrib/completion/git-completion.bash
export GIT_PROMPT_PATH=/usr/local/git/contrib/completion/git-prompt.sh

# JAVA_HOME folder
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home
