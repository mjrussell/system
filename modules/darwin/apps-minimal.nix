{ config, lib, pkgs, ... }: {
  homebrew = {
    casks = [
      "discord"
      "raycast"
      "stats"
      "visual-studio-code"
      "dash"
    ];

    cleanup = "uninstall";

    brews = [
      "postgresql@12"
    ];
  };
}
