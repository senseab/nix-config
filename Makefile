############################################################################
#
#  Nix commands related to the local machine
#
############################################################################
DEVICE="default"

deploy:
	nixos-rebuild switch --flake '.#$(DEVICE)' --use-remote-sudo

debug:
	nixos-rebuild switch --flake '.#$(DEVICE)' --use-remote-sudo --show-trace --verbose

build:
	nixos-rebuild build --flake '.#$(DEVICE)t' --show-trace --verbose

test:
	nixos-rebuild dry-build --flake '.#$(DEVICE)' --show-trace --verbose

update:
	nix flake update

history:
	nix profile history --profile /nix/var/nix/profiles/system

gc:
	# remove all generations older than 7 days
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 3d

	# garbage collect all unused nix store entries
	sudo nix store gc --debug
	nix-collect-garbage -d