{ config, lib, pkgs, ... }: {
  homebrew = {
    casks = [
      "discord"
      "raycast"
      "stats"
      "visual-studio-code"
    ];

    brews = [
      "flyway"
      "postgresql@12"
      "stack"
    ];
  };
}
