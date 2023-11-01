{
  lib,
  config,
  pkgs,
  ...
}: {
  options.systemModules.kernel.enable = lib.mkEnableOption "";

  options.systemModules.kernel.type = lib.mkOption {
    default = "stable";
    type = lib.types.str;
    description = "Choose the kernel type. ('latest', 'zen' or 'lts')";
  };

  config = lib.mkIf config.systemModules.kernel.enable {
    boot = {
      # Disable Mobo Beep & Bluetooth
      blacklistedKernelModules = ["pcspkr" "btusb" "bluetooth"];

      # Silent Boot
      kernelParams = ["fbcon=nodefer" "bgrt_disable" "quiet" "systemd.show_status=false" "rd.udev.log_level=0" "vt.global_cursor_default=0"];
      consoleLogLevel = 0;
      initrd.verbose = false;

      # Set Kernel Package
      kernelPackages = pkgs."linuxPackages_${config.systemModules.kernel.type}";
    };
  };
}
