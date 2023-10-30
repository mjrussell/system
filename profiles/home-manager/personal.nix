{ config, lib, pkgs, ... }: {
  imports = [ ../../modules/home-manager/1password.nix ];

  programs.git = {
    enable = true;
    package = pkgs.git;
    userEmail = "matthewjosephrussell@gmail.com";
    userName = "Matthew Russell";
    extraConfig = {
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFsuQpHchfqyjLQoKLQt6KLtvGeGbJK6krwUxVLjbNzd";
    };
  };
}
