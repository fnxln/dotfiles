{ pkgs, ... }:
{
  imports = [ ./common.nix ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  programs.hyprland.enableNvidiaPatches = true;
  programs.hyprland.enable = true;
  services.xserver.enable = true;
  environment.systemPackages = with pkgs; [
    catppuccin-gtk
    catppuccin-kde
    wl-clipboard
    jq
    swww
    yad
    rofi
    grim
    slurp
    swappy
    kitty
    cliphist
    dunst
    mpv
    swaylock-effects
    nwg-look
    qt5ct
    pywal
    wlogout


  ];


}
