{ config, lib, pkgs, ... }: {
  homebrew = {
    casks = [
      "discord"
      "raycast"
      "stats"
      "visual-studio-code"
    ];

    brews = [
      "postgresql@12"
      "stack"
    ];
  };
}
