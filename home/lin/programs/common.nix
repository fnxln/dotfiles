{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Archives
    zip
    unzip
    p7zip
    # utils
    ripgrep
    yt-dlp
    htop
    # Internet
    discord
    vesktop
    megasync
    neofetch
    noto-fonts-cjk

    noto-fonts-emoji
    liberation_ttf
    jetbrains-mono
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    noto-fonts
    #C:\system32
    wineWowPackages.waylandFull

    #TODO: Oraganize
    git
    lazygit
    ungoogled-chromium
    thefuck
    obs-studio
    gcc
    python3
    poetry
    fzf
    git
    unrar
    spotify
    waybar
    parsec-bin
    piper
    corepack
    wget
    nodejs
  ];
  programs.zsh.enable = true;
}
