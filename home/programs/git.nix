{
  programs.git.ignores = [
    ".DS_Store"
    "*~"
    "*.swp"
  ];
  programs.git.userName = "Sense T";
  programs.git.userEmail = "me@sense-t.eu.org";

  programs.git.extraConfig.credential."https://git.sense-t.eu.org/".username = "senset";
}
