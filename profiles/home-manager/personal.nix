{ config, lib, pkgs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.git;
    userEmail = "matthewjosephrussell@gmail.com";
    userName = "Matthew Russell";
  };
}
