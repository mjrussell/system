{ config, lib, pkgs, ... }: {
  homebrew = {
    casks = [
      "raycast"
      "stats"
      "visual-studio-code"
    ];
  };
}
