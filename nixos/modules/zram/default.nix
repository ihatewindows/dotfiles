{
  lib,
  config,
  ...
}: {
  options.systemModules.zram.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.zram.enable {
    zramSwap = {
      enable = true;
      algorithm = "lz4";
      memoryPercent = 25;
    };
  };
}
