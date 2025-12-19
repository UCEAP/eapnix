#!/usr/bin/env bash

set -e

dnf install -y fedora-workstation-repositories
dnf config-manager setopt google-chrome.enabled=1
