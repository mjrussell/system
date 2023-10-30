{ config, lib, pkgs, ... }: {
  user.name = "matt";
  hm = { imports = [ ./home-manager/work.nix ]; };

  fonts.fontDir.enable = true;
}
