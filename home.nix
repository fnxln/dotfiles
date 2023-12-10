{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lin";
  home.homeDirectory = "/home/lin";

  # shell

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages =
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    with pkgs; [
      firefox
      kate
      discord
      vesktop
      megasync
      neofetch
      p7zip
      kubectl
      catppuccin-gtk
      catppuccin-kde
      ripgrep
      lazygit
      ungoogled-chromium
      thefuck
      obs-studio
      gcc
      neovide
      python3
      poetry
      fzf
      git
      neovim
      unrar
      spotify
      waybar
      parsec-bin
      piper
      wl-clipboard
      jq
      swww
      corepack
      wget
      wineWowPackages.waylandFull
      nodejs
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
      #  thunderbird

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
      (pkgs.nerdfonts.override {
        fonts = [ "FiraCode" "DroidSansMono" ];
      })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

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
  #  /etc/profiles/per-user/lin/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "neovide";
  };
  programs.zsh = {
    enable = true;
    shellAliases = {
      "v" = "nvim";
    };
    oh-my-zsh = {
      enable = true;
      theme = "bira";
      plugins = [ "git" "kubectl" "thefuck" ];
    };
  };

  fonts.fontconfig.enable = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
