# scailx_progr RPI4 nixos image generator with custom config

## Goals

Creates a custom [NixOS](https://nixos.org/) NixOS ISO images for raspberry pi.

The idea is to use this config to track the packages/setup we need in the scailx-progr RPI device to program/test/verify scailx devices.

## Usage

2. Go to the github actions section
3. Click on "Build ISO"
4. Trigger the workflow with the inputs you want to customize
5. Wait
6. Download the ISO
7. Flash it using [Etcher](https://etcher.balena.io/) or similar.

### Check all is good

```sh
nix flake check --impure
```

### Build

Supported arch `aarch64-linux`

```sh
nix build
```

## What services can you configure?

Take a look at [nixos configuration](https://nixos.org/manual/nixos/stable/index.html#ch-configuration).