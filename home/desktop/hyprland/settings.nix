{
  launcher,
  terminal,
  window,
  filebrowser,
  ...
}:
{
  exec-once = [
    "systemctl --user start fcitx5-daemon"
    #"waybar"
  ];

  # variables
  "$mainMod" = "SUPER";
  "$launcher" = launcher;
  "$term" = terminal;
  "$window" = window;
  "$filebrowser" = filebrowser;

  bind = [
    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    "$mainMod, RETURN, exec, $term"
    "$mainMod SHIFT, Q, killactive,"
    #"$mainMod, M, exit"
    "$mainMod, V, togglefloating,"
    "$mainMod, ESCAPE, exec, $launcher"
    "$mainMod, TAB, exec, $window"
    "$mainMod, F, exec, $filebrowser"
    "$mainMod, P, pseudo," # dwindle
    "$mainMod, J, togglesplit," # dwindle

    # Move focus with mainMod + arrow keys
    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, up, movefocus, u"
    "$mainMod, down, movefocus, d"

    # Switch workspaces with mainMod + [0-9]
    "$mainMod, 1, workspace, 1"
    "$mainMod, 2, workspace, 2"
    "$mainMod, 3, workspace, 3"
    "$mainMod, 4, workspace, 4"
    "$mainMod, 5, workspace, 5"
    "$mainMod, 6, workspace, 6"
    "$mainMod, 7, workspace, 7"
    "$mainMod, 8, workspace, 8"
    "$mainMod, 9, workspace, 9"
    "$mainMod, 0, workspace, 10"

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    "$mainMod SHIFT, 1, movetoworkspace, 1"
    "$mainMod SHIFT, 2, movetoworkspace, 2"
    "$mainMod SHIFT, 3, movetoworkspace, 3"
    "$mainMod SHIFT, 4, movetoworkspace, 4"
    "$mainMod SHIFT, 5, movetoworkspace, 5"
    "$mainMod SHIFT, 6, movetoworkspace, 6"
    "$mainMod SHIFT, 7, movetoworkspace, 7"
    "$mainMod SHIFT, 8, movetoworkspace, 8"
    "$mainMod SHIFT, 9, movetoworkspace, 9"
    "$mainMod SHIFT, 0, movetoworkspace, 10"

    # Scroll through existing workspaces with mainMod + scroll
    "$mainMod, mouse_down, workspace, e+1"
    "$mainMod, mouse_up, workspace, e-1"

    # XF86Keys
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86MonBrightnessUP, exec, light -A 5"
    ", XF86MonBrightnessDown, exec, light -U 5"
  ];

  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];

  monitor = ",preferred,auto,1";

  #env = [ "XCURSOR_SIZE,24" ];

  input = {
    kb_layout = "cn";
    kb_options = "compose:caps";

    follow_mouse = 1;
    sensitivity = 0;

    touchpad.natural_scroll = true;
  };

  general = {
    gaps_in = 4;
    gaps_out = 8;
    border_size = 2;
    layout = "dwindle";

    "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    "col.inactive_border" = "rgba(595959aa)";
  };

  decoration = {
    rounding = 4;
    "col.shadow" = "rgba(1a1a1aee)";
    blur.size = 3;
  };

  animations = {
    enabled = true;

    bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

    animation = [
      "windows, 1, 7, myBezier"
      "windowsOut, 1, 7, default, popin 80%"
      "border, 1, 10, default"
      "borderangle, 1, 8, default"
      "fade, 1, 7, default"
      "workspaces, 1, 6, default"
    ];
  };

  dwindle = {
    pseudotile = true;
  };

  master = {
    new_status = "master";
  };

  gestures = {
    workspace_swipe = true;
  };
}
