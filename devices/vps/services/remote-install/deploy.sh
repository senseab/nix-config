#!/usr/bin/env bash

STORE_URL="https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" 
URL="git+https://${AUTH}@git.sense-t.eu.org/NixOS/configs"

echo "[!] Install nixos with senset's all-in-one config..."
echo "[>] Got URL ${URL}"
echo "[>] Got schema ${DEVICE}"
echo "[>] Got target ${TARGET}"

nix --refresh --experimental-features "nix-command flakes" \
    run "${URL}#remote-install" -- \
    --flake "${URL}#${DEVICE}" \
    --no-substitute-on-destination \
    --option substituters ${STORE_URL} \
    --option trusted-users $(whoami) \
    ${TARGET} 