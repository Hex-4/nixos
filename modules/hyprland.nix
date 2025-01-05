{
  lib,
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$rosewater" = "rgb(f5e0dc)";
      "$rosewaterAlpha" = "f5e0dc";

      "$flamingo" = "rgb(f2cdcd)";
      "$flamingoAlpha" = "f2cdcd";

      "$pink" = "rgb(f5c2e7)";
      "$pinkAlpha" = "f5c2e7";

      "$mauve" = "rgb(cba6f7)";
      "$mauveAlpha" = "cba6f7";

      "$red" = "rgb(f38ba8)";
      "$redAlpha" = "f38ba8";

      "$maroon" = "rgb(eba0ac)";
      "$maroonAlpha" = "eba0ac";

      "$peach" = "rgb(fab387)";
      "$peachAlpha" = "fab387";

      "$yellow" = "rgb(f9e2af)";
      "$yellowAlpha" = "f9e2af";

      "$green" = "rgb(a6e3a1)";
      "$greenAlpha" = "a6e3a1";

      "$teal" = "rgb(94e2d5)";
      "$tealAlpha" = "94e2d5";

      "$sky" = "rgb(89dceb)";
      "$skyAlpha" = "89dceb";

      "$sapphire" = "rgb(74c7ec)";
      "$sapphireAlpha" = "74c7ec";

      "$blue" = "rgb(89b4fa)";
      "$blueAlpha" = "89b4fa";

      "$lavender" = "rgb(b4befe)";
      "$lavenderAlpha" = "b4befe";

      "$text" = "rgb(cdd6f4)";
      "$textAlpha" = "cdd6f4";

      "$subtext1" = "rgb(bac2de)";
      "$subtext1Alpha" = "bac2de";

      "$subtext0" = "rgb(a6adc8)";
      "$subtext0Alpha" = "a6adc8";

      "$overlay2" = "rgb(9399b2)";
      "$overlay2Alpha" = "9399b2";

      "$overlay1" = "rgb(7f849c)";
      "$overlay1Alpha" = "7f849c";

      "$overlay0" = "rgb(6c7086)";
      "$overlay0Alpha" = "6c7086";

      "$surface2" = "rgb(585b70)";
      "$surface2Alpha" = "585b70";

      "$surface1" = "rgb(45475a)";
      "$surface1Alpha" = "45475a";

      "$surface0" = "rgb(313244)";
      "$surface0Alpha" = "313244";

      "$base" = "rgb(1e1e2e)";
      "$baseAlpha" = "1e1e2e";

      "$mantle" = "rgb(181825)";
      "$mantleAlpha" = "181825";

      "$crust" = "rgb(11111b)";
      "$crustAlpha" = "11111b";

      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 10;
        gaps_out = 16;
        border_size = 3;
        "col.active_border" = lib.mkForce "$red $peach $yellow 45deg";
        "col.inactive_border" = lib.mkForce "$surface1 $overlay1 45deg";
        no_border_on_floating = false;
        resize_on_border = true;
      };

      dwindle = {
        smart_split = true;
      };

      decoration = {
        rounding = 10;
        inactive_opacity = 0.6;
      };

      bind = [
        "$mainMod, Return, exec, pkill rofi || rofi -show drun"
        "$mainMod, X, killactive,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod SHIFT, F, fullscreen, 1"
        "ALT, Space, togglefloating,"
        "$mainMod, Q, exec, kitty"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        # Workspace switching
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        # Screenshot
        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy -t image/png"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      env = [
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];

      exec-once = [
        "waybar"
        "hyprpaper"
      ];
    };
  };
}
