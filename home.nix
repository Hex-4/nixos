{ config, pkgs, ... }:

{
  
  imports = [
    ./modules/starship.nix
    modules/hyprland.nix
    modules/rofi.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hexatron";
  home.homeDirectory = "/home/hexatron";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.


  stylix.targets.firefox.enable = true;

  # 󰏖 The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello


    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.discord
    pkgs.discordo
    pkgs.vesktop
    pkgs.floorp
    pkgs.fish
    pkgs.neovim
    pkgs.nodejs_22
    pkgs.unzipNLS
    pkgs.python3
    pkgs.libgcc
    pkgs.neofetch
    pkgs.atuin
    pkgs.btop
    pkgs.bat
    pkgs.eza
    pkgs.tldr
    pkgs.tmux
    (pkgs.appimageTools.wrapType2 { # or wrapType1
      name = "obsidian";
      src = pkgs.fetchurl {
        url = "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.12/Obsidian-1.5.12.AppImage";
        hash = "sha256-qmXZmSp7YPZ2k2+8gNYW9Fz5s0aMSrYHMBI7cn9M8u4=";
     };
    extraPkgs = pkgs: with pkgs; [ ];
    })
    (pkgs.appimageTools.wrapType2 { # or wrapType1
      name = "breaktimer";
      src = pkgs.fetchurl {
        url = "https://github.com/tom-james-watson/breaktimer-app/releases/latest/download/BreakTimer.AppImage";
        hash = "sha256-bpc5EJ/5Gd908Or+A7wjhzUK3taUAcbxE69fmUGYFXs=";
      };
      extraPkgs = pkgs: with pkgs; [ ];
    })
    (pkgs.appimageTools.wrapType2 { # or wrapType1
      name = "kando";
      src = pkgs.fetchurl {
        url = "https://github.com/kando-menu/kando/releases/download/v1.2.0/Kando-1.2.0-x86_64.AppImage";
        hash = "sha256-kaxl9ffnOcjfONmI+lNt+NUkaD2N4wMfo/s72T7yL/M=";
      };
      extraPkgs = pkgs: with pkgs; [ ];
    })
    (pkgs.appimageTools.wrapType2 { # or wrapType1
      name = "brave";
      src = pkgs.fetchurl {
        url = "https://github.com/srevinsaju/Brave-AppImage/releases/download/v1.68.124/Brave-stable-v1.68.124-x86_64.AppImage";
        hash = "sha256-IcJ+EUfBiYdKDvk9o2JmlVeYJlkF57kKrFT/1fdUb9M=";
      };
      extraPkgs = pkgs: with pkgs; [ ];
    })
    
    pkgs.aseprite
    pkgs.gh
    pkgs.flyctl
    pkgs.godot_4
    pkgs.krita
    pkgs.slack
    pkgs.inkscape-with-extensions
    pkgs.alsa-oss
    (pkgs.steam.override { extraPkgs = pkgs: with pkgs; [pkgs.webkitgtk]; }).run
    pkgs.rustup
    pkgs.appimage-run
    pkgs.dijo
    pkgs.zed-editor
    pkgs.syncthingtray
    pkgs.syncthing
    pkgs.deno
    pkgs.tetrio-desktop
    pkgs.ffmpeg
    

    # Hyprland stuff
    pkgs.dunst
    pkgs.waybar
    pkgs.wttrbar
    pkgs.hyprpaper
    pkgs.rofi-wayland-unwrapped
    pkgs.xdg-desktop-portal-hyprland
  ];

programs.vscode = {
  enable = true;
  package = pkgs.vscodium.fhsWithPackages (ps: with ps; [ rustup zlib ]);
};

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/hexatron/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
