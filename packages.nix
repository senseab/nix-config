{
  system,
  nixos-anywhere,
  disko,
  ...
}:
{
  remote-install = nixos-anywhere.packages."${system}".nixos-anywhere;
  disko = disko.packages.${system}.disko;
  disko-install = disko.packages.${system}.disko-install;
}
