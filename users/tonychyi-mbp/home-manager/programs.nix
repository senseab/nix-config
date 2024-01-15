{
  programs.git.enable = true;
  programs.git.extraConfig.credential."https://git.sense-t.eu.org/".helper = "osxkeychain";

  programs.go = {
    enable = true;
    goPath = ".gopath";
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };
}
