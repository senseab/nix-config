{
  environment.variables = {
    HOMEBREW_API_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api";
    HOMEBREW_BOTTLE_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles";
    HOMEBREW_BREW_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git";
    HOMEBREW_CORE_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git";
    HOMEBREW_PIP_INDEX_URL = "https://pypi.tuna.tsinghua.edu.cn/simple";
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    masApps = {
      # TODO Feel free to add your favorite apps here.

      # Xcode = 497799835;
      Wechat = 836500024;
      # NeteaseCloudMusic = 944848654;
      # QQ = 451108668;
      # WeCom = 1189898970;  # Wechat for Work
      TecentMetting = 1484048379;
      # QQMusic = 595615424;
      Tampermonkey = 1482490089;
      AffinityPhoto = 824183456;
      Bitwarden = 1352778147;
      HPSmart = 1474276998;
    };

    # TODO package list
    brews = [
      "curl"
      "ffmpeg"
      "qemu"
      "proxychains-ng"
      "mas"
      "winetricks"
    ];

    # TODO package list
    casks = [
      "clock-bar"
      "macfuse"
      "ntfstool"
      "rar"
      "webpquicklook"
      "openlens"
      "bilibili"
      "openttd"
      "kekaexternalhelper"
      "onlyoffice"
      "warzone-2100"
      "tailscale"
    ];
  };
}
