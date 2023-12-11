{ self, config, pkgs, ... }:
{
  imports = [
    ./programs
    ./misc
    ./hyprland
    ./util
  ];
  home = {
    username = "lin";
    homeDirectory = "/home/lin";
    stateVersion = "23.11";
    file."Pictures/wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
  programs.home-manager.enable = true;
}
