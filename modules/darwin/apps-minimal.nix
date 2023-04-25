{ config, lib, pkgs, ... }: {
  homebrew = {
    casks = [
      "dash"
      "discord"
      "hot"
      "insomnia"
      "raycast"
      "rectangle"
      "slack"
      "stats"
      "todoist"
      "visual-studio-code"
      "obsidian"
    ];

    brews = [
      "postgresql@12"
    ];
  };
}
