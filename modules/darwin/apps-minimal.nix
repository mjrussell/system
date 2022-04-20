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
      "haskell-language-server"
    ];
  };
}
