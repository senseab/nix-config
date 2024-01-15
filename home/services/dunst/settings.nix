{
  global = {
    width = 300;
    height = 300;
    offset = "30x50";
    origin = "top-right";
    notification_limit = 10;
    progress_bar = true;
    transparency = 20;
    corner_radius = 8;
  };

  urgency_low = {
    frame_color = "#3B7C87";
    foreground = "#3B7C87";
    background = "#191311";
    #background = "#2B313C"
    timeout = 4;
  };

  urgency_normal = {
    frame_color = "#5B8234";
    foreground = "#5B8234";
    background = "#191311";
    #background = "#2B313C"
    timeout = 6;
  };

  urgency_critical = {
    frame_color = "#B7472A";
    foreground = "#B7472A";
    background = "#191311";
    #background = "#2B313C"
    timeout = 8;
  };
}
