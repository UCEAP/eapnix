# EAPnix &nbsp; [![bluebuild build badge](https://github.com/UCEAP/eapnix/actions/workflows/build.yml/badge.svg)](https://github.com/UCEAP/eapnix/actions/workflows/build.yml)

This is a Fedora Atomic-based operating system for the [University of California Education Abroad Program](https://uceap.universityofcalifornia.edu/) Software Engineering team. This is a lightly customized version of [Aurora DX](https://getaurora.dev/), so please refer to the Aurora documentation to learn more about this system.

It is built using [BlueBuild](https://blue-build.org), a tool for building and distributing immutable operating systems.

## Installation

### New system installation from ISO

1. Download the ISO from https://bkurowskitest.blob.core.windows.net/linux/eapnix-dx.iso
2. Optionally check the download
    ```bash
    curl https://bkurowskitest.blob.core.windows.net/linux/eapnix-dx.iso-CHECKSUM | sha256sum -c
    ```
3. Write the ISO to a flash drive (use [Fedora Media Writer](https://fedoraproject.org/atomic-desktops/kinoite/download) if you don't have other software for this)
4. Boot from the flash drive and follow installation instructions

### Rebase from an existing installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/uceap/eapnix-dx:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/uceap/eapnix-dx:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

1. `sudo bluebuild generate-iso --iso-name eapnix-dx.iso image ghcr.io/uceap/eapnix-dx`
2. `az storage blob upload --account-name bkurowskitest --container-name linux --file eapnix-dx.iso`
3. `az storage blob upload --account-name bkurowskitest --container-name linux --file eapnix-dx.iso-CHECKSUM`

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/uceap/eapnix-dx
```
