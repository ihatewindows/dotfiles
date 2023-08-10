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
      neovim.enable = true;
      firefox.enable = true;
      vscode.laptopConfig.enable = true;
      alacritty.laptopConfig.enable = true;
      polybar.laptopConfig.enable = true;
      dunst.laptopConfig.enable = true;
      i3.laptopConfig.enable = true;
    };
  };

  home.packages = with pkgs; [
    # General
    webcord-vencord

    # Productivity
    obsidian

    # Environment
    dmenu
    scrot
    feh
    pavucontrol
    gnome.nautilus
    redshift
    brightnessctl
    pamixer
    neofetch
  ];

  home.stateVersion = "23.05";
  home.homeDirectory = "/home/alex";
  sops.age.sshKeyPaths = ["$HOME/.ssh/id_ed25519"];
}
