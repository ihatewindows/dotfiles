{...}: {
  imports = [
    ../../modules
  ];

  systemModules = {
    user.alex.enable = true;
    pipewire.enable = true;
    easyeffects.enable = true;
    systemd-boot.enable = true;
    colemak.enable = true;
    fonts.enable = true;
    libinput.enable = true;
    gnome-keyring.enable = true;
    networkmanager.enable = true;
    udev.via.enable = false;
    fstrim.enable = true;
    polkit.enable = true;

    kernel = {
      enable = true;
      type = "zen";
    };

    zram = {
      enable = true;
      percentage = 20;
    };

    sway = {
      enable = true;
      host = "jade";
    };

    nvidia = {
      enable = true;
    };

    opengl = {
      enable = true;
    };
    
    gdm = {
      enable = true;
      backend = "wayland";
    };

  };
}
