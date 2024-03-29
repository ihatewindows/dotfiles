{
  lib,
  config,
  ...
}: {
  options.modules.containers.homepage.enable = lib.mkEnableOption "";

  config = lib.mkIf config.modules.containers.homepage.enable {
    virtualisation.oci-containers.containers.homepage = {
      image = "ghcr.io/gethomepage/homepage:latest";
      autoStart = true;
      ports = ["80:3000"];
      volumes = [
        "/home/alex/.config/homepage-dashboard:/app/config"
        "/run/podman/podman.sock:/var/run/docker.sock"
      ];
    };
  };
}
