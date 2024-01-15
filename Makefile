############################################################################
#
#  Nix commands related to the local machine
#
############################################################################
DEVICE ?= default
ROOT ?= /mnt
TARGET_DISK ?= /dev/sda
SUBSTITUTER ?= "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
TARGET_HOST ?= root@localhost

all:
	@echo "nothing."

hardware-config:
	ssh $(TARGET_HOST) nixos-generate-config --show-hardware-config --no-filesystems > ./devices/$(DEVICE)/hardware-configuration.nix

install-remote:
	nix run '.#remote-install' -- -f '.#$(DEVICE)' --generate-hardware-config nixos-generate-config ./hardware-configuration.nix $(TARGET_HOST)

install-disk:
	nix --extra-substituters $(SUBSTITUTER) --experimental-features "nix-command flakes" run github:nix-community/disko/latest#disko-install -- --flake '.#$(DEVICE)' --write-efi-boot-entries --disk main $(TARGET_DISK)

install:
	nixos-install --root $(ROOT) --flake '.#$(DEVICE)'

deploy:
	nixos-rebuild switch --flake '.#$(DEVICE)' --use-remote-sudo

deploy-remote:
	NIX_SSHOPTS="-v -tt" nixos-rebuild switch --flake '.#$(DEVICE)' --use-remote-sudo --target-host $(DEVICE) --build-host $(DEVICE) --verbose

debug:
	nixos-rebuild switch --flake '.#$(DEVICE)' --use-remote-sudo --show-trace --verbose

build:
	nixos-rebuild build --flake '.#$(DEVICE)' --show-trace --verbose

test:
	nixos-rebuild dry-build --flake '.#$(DEVICE)' --show-trace --verbose

update:
	nix flake update

history:
	nix profile history --profile /nix/var/nix/profiles/system

format:
	@nixfmt devices home lib system users modules *.nix

gc:
	# remove all generations older than 7 days
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 3d

	# garbage collect all unused nix store entries
	sudo nix store gc --debug
	nix-collect-garbage -d