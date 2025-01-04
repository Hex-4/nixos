{lib, config, pkgs, ...}:
{
  programs.rofi = {
    package = pkgs.rofi-wayland-unwrapped;
    enable = true;
    theme = ./catppuccin-mocha.rasi;
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      disable-history = false;
      display-drun = " 󱃲  Apps";
      display-run = "   Run";
      display-window = "   Windows";
      display-Network = " 󰖩  Network";
      sidebar-mode = true;
    };
  };
}
