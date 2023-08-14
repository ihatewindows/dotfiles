{
  lib,
  config,
  ...
}: {
  options.systemModules.udev.via.enable = lib.mkEnableOption "";

  # udev rule for letting via discover keyboards
  config = lib.mkIf config.systemModules.udev.via.enable {
    services.udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
  };
}