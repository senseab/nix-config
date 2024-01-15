{
  programs.git.enable = true;
  programs.git.config = {
    credential."https://git.sense-t.eu.org/" = {
      username = "senset";
      helper = "store";
    };
  };
}
