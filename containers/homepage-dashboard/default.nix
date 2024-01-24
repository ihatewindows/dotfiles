{
  lib,
  config,
  ...
}: {
  options.containers.homepage-dashboard.enable = lib.mkEnableOption "";

  config = lib.mkIf config.containers.homepage-dashboard.enable {

    containers.homepage-dashboard = {
      autoStart = true;
      privateNetwork = true;
      
      services.homepage-dashboard = {
        enable = true;
        listenPort = 80;
      };

      networking = {
        firewall = {
          enable = true;
          allowedTCPPorts = [ 80 ];
        };
        useHostResolvConf = mkForce false;
      };
      
      services.resolved.enable = true;
    };
  };
}