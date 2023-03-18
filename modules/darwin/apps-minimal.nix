{ config, lib, pkgs, ... }: {
  homebrew = {
    casks = [
      "dash"
      "discord"
      "insomnia"
      "raycast"
      "stats"
      "todoist"
      "visual-studio-code"
    ];

    brews = [
      "postgresql@12"
    ];
  };
}
