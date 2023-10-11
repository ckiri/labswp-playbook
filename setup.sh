#!/bin/bash
#
# Setup script to configure our development enviroment.

#######################################
# Prompt user for input.
# Inputs:
#   vm_user: username of the vm's non root user.
#######################################
prompt_user() {
  read -p "Enter the username of your VM user (not root): " vm_user
  read -p "Enter the username of your GitLab account: " gitlab_user
  read -s -p "Enter your PAT generated in GitLab: " gitlab_token
  printf "\n"
}

#######################################
# Start ansible playbook with inventory
# file and user specific variables.
# Prompts user for root password.
#######################################
start_ansible() {
  ansible-playbook \
    -i "inventory" \
    -e "vm_user=$vm_user gitlab_user=$gitlab_user gitlab_token=$gitlab_token" \
    playbook.yml -K
}

setup() {
  prompt_user
  start_ansible
}

setup
