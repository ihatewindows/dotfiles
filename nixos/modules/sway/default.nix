{
  lib,
  config,
  pkgs,
  ...
}: {
  options.systemModules.sway.ruby.enable = lib.mkEnableOption "";
  # Configuration
  config = lib.mkIf config.systemModules.sway.ruby.enable {
    programs.sway = {
      enable = true;
      package = pkgs.swayfx.overrideAttrs (_old: {passthru.providedSessions = ["sway"];});
      extraPackages = with pkgs; [
        brightnessctl # Backlight Control
        dmenu-wayland # Application Launcher
        mako # Notification Daemon
        fltk # Keymap Control
        nitch # System Stats
        pavucontrol # Audio GUI
        grim # Screenshot Tool
        wl-clipboard # Clipboard Tool
        waybar # System Bar
        gnome.nautilus # File Explorer
        pamixer # Volume Bindings
      ];
    };
  };
}
