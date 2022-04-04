{ config, lib, pkgs, ... }: {
  user.name = "matthewrussell";
  hm = { imports = [ ./home-manager/personal.nix ]; };
}
