{ config, lib, pkgs, ... }: {
  user.name = "matt";
  hm = { imports = [ ./home-manager/personal.nix ]; };

  homebrew.casks = [
    "steam"
  ];

  fonts.fontDir.enable = true;
}
