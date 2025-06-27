# EAPnix &nbsp; [![bluebuild build badge](https://github.com/UCEAP/eapnix/actions/workflows/build.yml/badge.svg)](https://github.com/UCEAP/eapnix/actions/workflows/build.yml)

This is a Fedora Atomic-based operating system for the [University of California Education Abroad Program](https://uceap.universityofcalifornia.edu/) Software Engineering team. This is a lightly customized version of [Aurora DX](https://getaurora.dev/), so please refer to the Aurora documentation to learn more about this system.

It is built using [BlueBuild](https://blue-build.org), a tool for building and distributing immutable operating systems.

## Installation

### _Recommended_: Install new system from ISO

1. Download the ISO from https://bkurowskitest.blob.core.windows.net/linux/eapnix-dx.iso
2. Write the ISO to a flash drive (use [Fedora Media Writer](https://fedoraproject.org/atomic-desktops/kinoite/download) if you don't have other software for this)
3. Boot from the flash drive and follow installation instructions

### _Alternative_: Rebase from an existing install

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/uceap/eapnix-dx:latest
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/uceap/eapnix-dx:latest
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

```bash
sudo bluebuild generate-iso --iso-name eapnix-dx.iso image ghcr.io/uceap/eapnix-dx
az storage blob upload --account-name bkurowskitest --container-name linux --overwrite --file eapnix-dx.iso
az storage blob upload --account-name bkurowskitest --container-name linux --overwrite --file eapnix-dx.iso-CHECKSUM
```
