# from rubyowo/dotfiles; translated to nix and modified to my needs
{lib, config, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left =  ["custom/shutdown" "hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = ["pulseaudio" "cpu" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = false;
          sort-by-name = true;
          format = " {icon} ";
          format-icons = {
              default = "󰋙";
              active = "󰋘";
          };
          persistent-workspaces = {
            "*" = 6;
          };
        };
        tray =  {
          icon-size = 21;
          spacing = 10;
        };
        "clock" = {
          "timezone" = "America/Edmonton";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = " {:%d/%m/%Y}";
          "format" = " {:%H:%M}";
        };
        pulseaudio = {

          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = {
              default = ["" "" " "];
          };
          on-click = "pavucontrol";
        };
        cpu = {
          interval = 10;
          format = "  {}%";
          max-length = 10;
        };

        "custom/shutdown" = {
          format = " ";
          tooltip = false;
          on-click = "shutdown now";
        };
      };
    };
  };
}