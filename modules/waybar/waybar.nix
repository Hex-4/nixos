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
        modules-left =  ["hyprland/workspaces"];
        modules-center = ["load"];
        modules-right = ["pulseaudio" "clock" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = " {icon} ";
          format-icons = {
              default = "󰋙";
              active = "󰋘";
          };
          persisent-workspaces = {
            "*" = 5;
          };
        };
        tray =  {
          icon-size = 21;
          spacing = 10;
        };
        "clock" = {
          "timezone" = "America/Edmonton";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = " {:%d/%m/%Y}";
          "format" = " {:%H:%M}";
        };
        pulseaudio = {

          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = {
              default = ["" "" " "];
          };
          on-click = "pavucontrol";
        };
        load = {
          interval = 10;
          format = "  {load1}";
          max-length = 10;
        };
      };
    };
  };
}