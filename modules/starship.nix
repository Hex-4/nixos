{ lib, config, pkgs, ... }:
{
  programs.starship.settings = {
    scan_timeout = 10;
    character = {
      success_symbol = "➜";
      error_symbol = "➜";
    };
  };
}
