{ ... }:
{

  programs.zsh = {
    enable = true;
    shellAliases = {
      vi = "neovide";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" "kubectl" "fzf" ];
      theme = "bira";
    };
  };
}
