{
  lib,
  config,
  pkgs,
  ...
}: {
  options.systemModules.kernel.jade.enable = lib.mkEnableOption "";
  options.systemModules.kernel.ruby.enable = lib.mkEnableOption "";

  config = lib.mkMerge [
    (lib.mkIf config.systemModules.kernel.jade.enable {
      boot = {
        # Disable MOBO Beep & Bluetooth
        blacklistedKernelModules = ["pcspkr" "btusb" "bluetooth"];

        # Silence Boot Stage
        kernelParams = ["fbcon=nodefer" "bgrt_disable" "quiet" "systemd.show_status=false" "rd.udev.log_level=0" "vt.global_cursor_default=0"];
        consoleLogLevel = 0;
        initrd.verbose = false;

        # Zen Kernel
        kernelPackages = pkgs.linuxPackages_latest;
      };
    })
    (lib.mkIf config.systemModules.kernel.ruby.enable {
      boot = {
        # Disable MOBO Beep & Bluetooth
        blacklistedKernelModules = ["pcspkr" "btusb" "bluetooth"];

        # Silence Boot Stage
        kernelParams = ["fbcon=nodefer" "bgrt_disable" "quiet" "systemd.show_status=false" "rd.udev.log_level=0" "vt.global_cursor_default=0"];
        consoleLogLevel = 0;
        initrd.verbose = false;

        # Stable Kernel
        kernelPackages = pkgs.linuxPackages_latest;
      };
    })
  ];
}
