#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export NPC_HOME=/home/ebotian/ysyx-workbench/npc
export NVBOARD_HOME=/home/ebotian/ysyx-workbench/nvboard
