{ config, lib, pkgs, ... }: {
  imports = [ ../../modules/home-manager/1password.nix ];

  programs.git = {
    enable = true;
    package = pkgs.git;
    userEmail = "matthewjosephrussell@gmail.com";
    userName = "Matthew Russell";
  };
}
