{ config, lib, pkgs, ... }: {
  homebrew = {
    casks = [
      "discord"
      "raycast"
      "stats"
      "visual-studio-code"
      "dash"
    ];

    brews = [
      "postgresql@12"
    ];
  };
}
