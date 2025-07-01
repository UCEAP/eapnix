# EAPnix &nbsp; [![bluebuild build badge](https://github.com/UCEAP/eapnix/actions/workflows/build.yml/badge.svg)](https://github.com/UCEAP/eapnix/actions/workflows/build.yml)

This is a Fedora Atomic-based operating system for the [University of California Education Abroad Program](https://uceap.universityofcalifornia.edu/) Software Engineering team. This is a lightly customized version of [Aurora DX](https://getaurora.dev/), so please refer to the Aurora documentation to learn more about this system.

It is built using [BlueBuild](https://blue-build.org), a tool for building and distributing immutable operating systems.

## Installation

### _Recommended_: Install new system from ISO

1. Download the ISO from https://bkurowskitest.blob.core.windows.net/linux/eapnix-dx.iso
2. Write the ISO to a flash drive (use [Fedora Media Writer](https://fedoraproject.org/atomic-desktops/kinoite/download) if you don't have other software for this)
3. Boot from the flash drive and follow installation instructions
4. _Be sure to enable full disk encryption!_

### _Alternative_: Rebase from an existing install

To rebase an existing atomic Fedora installation to the latest build:

  ```
  sudo bootc switch ghcr.io/uceap/eapnix-dx:latest
  systemctl reboot
  ```

## First boot

Here are some recommended steps after you first boot:

1. Open System Settings > Users > Configure fingerprint authentication (_or you'll type your password a lot_)
2. Open 1Password desktop (_so the next step can access secrets_)
    1. Login to account
    2. Settings > Developer > Use the SSH Agent
    3. ~~Settings > Developer > Integrate with 1Password CLI~~
        - _Until https://github.com/UCEAP/eapnix/issues/6 is resolved, open a terminal and run:_
            ```zsh
            op account add --address team-uceap.1password.com
            eval $(op signin)
            ````
3. Personalize your environment:
    ```bash
    chezmoi init YOUR_GITHUB_USERNAME
    chezmoi apply
    ```
    _see http://github.com/kurowski/dotfiles for an example to get started with chezmoi_
