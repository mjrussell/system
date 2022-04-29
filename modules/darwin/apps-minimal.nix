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
      "flyway"
      "postgresql@12"
      "stack"
      # Commented out until brew has 1.7.0
      # Using ghcup for now
      # "haskell-language-server"
    ];
  };
}
