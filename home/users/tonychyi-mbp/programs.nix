{
  go = {
    enable = true;
    goPath = ".gopath";
  };

  zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "sudo" "git" "golang" "thefuck" "kubectl" "emoji" "pip" "npm" "yarn" "vscode" ];
      theme = "agnoster";
    };
  };
}