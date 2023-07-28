{
  pkgs,
  ...
}: {
  imports = [
    ../../modules
  ];

  homeModules = {
    programs = {
      bash.enable = true;
      direnv.enable = true;
      git.enable = true;
      mpd.enable = true;
      neovim.enable = true;
      alacritty.desktopConfig.enable = true;
      polybar.desktopConfig.enable = true;
      dunst.desktopConfig.enable = true;
      i3.desktopConfig.enable = true;
    };
  };


  home.packages = with pkgs; [
    # General
    firefox
    obs-studio
    vlc
    webcord-vencord

    # Programming
    vscodium

    # Gaming
    osu-lazer-bin
    prismlauncher
    lunar-client
    lutris
    protonup-qt

    # Environment
    dmenu
    scrot
    feh
    pavucontrol
    gnome.nautilus
    neofetch
    redshift
    easyeffects
  ];

  home.stateVersion = "23.05";
}