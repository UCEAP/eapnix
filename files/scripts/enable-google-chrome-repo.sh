#!/usr/bin/env bash

set -e

# dnf config-manager setopt google-chrome.enabled=1

# Enable the Google Chrome repo by setting enabled=1
if [ -f /etc/yum.repos.d/google-chrome.repo ]; then
  sudo sed -i 's/^enabled=0$/enabled=1/' /etc/yum.repos.d/google-chrome.repo
  echo "Google Chrome repository enabled."
else
  echo "/etc/yum.repos.d/google-chrome.repo not found."
fi
