# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

let
  myfonts = import ./myfonts.nix { inherit pkgs; };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;



  #  Enable Flakes: Lock your sytem to a nixpkgs commit, and be able to add multiple sources
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  #   Flathub
  services.flatpak.enable = true;

  # 󰞉 Enable networking
  networking.networkmanager.enable = true;

  # 󰂯 Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  services.joycond.enable = true;

  # 󰔠 Set your time zone.
  time.timeZone = "America/Edmonton";

  # 󰇧 Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_CA.UTF-8";
    LC_IDENTIFICATION = "en_CA.UTF-8";
    LC_MEASUREMENT = "en_CA.UTF-8";
    LC_MONETARY = "en_CA.UTF-8";
    LC_NAME = "en_CA.UTF-8";
    LC_NUMERIC = "en_CA.UTF-8";
    LC_PAPER = "en_CA.UTF-8";
    LC_TELEPHONE = "en_CA.UTF-8";
    LC_TIME = "en_CA.UTF-8";
  };

  #   Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];

  # 󰇀 Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  #  Enable CUPS to print documents.
  services.printing.enable = true;

  # 󰋋 Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # 󰈺 Add fish 
  programs.fish.enable=true;

  programs.hyprland.enable = true;

  # 󱃲 Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hexatron = {
    isNormalUser = true;
    description = "Hex Four";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "hexatron" "dialout" "gamemode"];
    packages = with pkgs; [
      firefox
      kate
      gum
      kitty
      lmms
    #  thunderbird
    ];
  };

  programs.dconf.enable = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.image = ./configuration.nix;
  stylix.enable = false;

  # Direnv - launch a nix-shell when you enter a directory
  programs.direnv.enable = true;

  # 🏠 Set up home-manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    backupFileExtension = "hm-bak";
    users = {
      "hexatron" = {imports = [ ./home.nix inputs.catppuccin.homeManagerModules.catppuccin];};
    };
  };

  #  Allow generic linux executables
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages:
  ];

  # 󰗦 Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  
  fonts.packages = [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    myfonts.fonts
    pkgs.ibm-plex
  ];

  fonts.fontDir.enable = true;

  # Folding@home
  services.foldingathome = {
    enable = true;
    team = 234980;
    user = "6pcwsx2o3xc3";
  };

  # 󰏗 List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    
    (pkgs.appimageTools.wrapType2 {
      name = "plover";
      src = pkgs.fetchurl {
        url = "https://github.com/openstenoproject/plover/releases/download/continuous/plover-4.0.0rc2+6.g53c416f-x86_64.AppImage";
        hash = "sha256-aoqytTczT3FWr2yOuC0Ai7nCD22Y23OGLNFfgI/fg7s=";
      };
      extraPkgs = pkgs: with pkgs; [ ];
    })
    gccgo13
    openrgb-with-all-plugins
    nh
    nixd
  ];

  # For nixd
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  hardware.graphics = {
    enable = true;

    enable32Bit = true;
    
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

# Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  programs.gamemode.settings = {
    general = {
      renice = 10;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # 󰣀
   services.openssh.enable = true;

  # OpenRGB (with plugins? maybe? idk man)
  services.hardware.openrgb.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
