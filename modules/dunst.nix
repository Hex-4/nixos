{
  lib,
  config,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "bottom-right";
        offset = "25x25";
        progress_bar = false;
        gap_size = 16;
        font = "JetBrainsMono Nerd Font 12";
        corner_radius = 10;
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#fab387";
      };
    };
  };
}
