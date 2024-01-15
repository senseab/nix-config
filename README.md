# Nix Config Merged

Merge all my nix config.

## Directory

* `system` - all shared system wide config.
* `home` - home-manager configs.
* `lib` - custom software.
* `devices` - my device running nix-related-entity.
* `users` - settings for user, merged with system config and home-manager.

## Install

```bash
# normal
nix-shell -p gnumake -p git -p nixos-install-tools 
nixos-install --root /mnt --flake 'git+https://<repo>?ref=refs/heads/main#device'

# disko
nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --flake 'git+https://<repo>?ref=refs/heads/main#device' --write-efi-boot-entries --disk main /dev/sda1
```
