{ lib, config, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      palette = "catppuccin_mocha";
      format = ''
        in $directory$git_branch$git_status
        $character
      '';
      right_format = "$all";
      character = {
        success_symbol = "[󱃲](bold peach)";
        error_symbol = "[⊘](italic red)";
      };
    } // builtins.fromTOML (builtins.readFile
      (pkgs.fetchFromGitHub
        {
          owner = "catppuccin";
          repo = "starship";
          rev = "5629d23"; # Replace with the latest commit hash
          sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
        } + /palettes/mocha.toml));
  };
}
