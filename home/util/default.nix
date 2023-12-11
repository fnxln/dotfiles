{ ... }:
{

  home.file = {

    # dunst config
    ".config/dunst" = {

      source = ./dunst;
      recursive = true;
    };
    ".config/cava" = {
      source = ./cava;
      recursive = true;
    };
    ".config/rofi" = {
      source = ./rofi;
      recursive = true;
    };

    ".config/swappy" = {
      source = ./swappy;
      recursive = true;
    };
    ".config/waybar" = {
      source = ./waybar;
      recursive = true;
    };

    ".config/wlogout" = {
      source = ./wlogout;
      recursive = true;
    };

  };
}
