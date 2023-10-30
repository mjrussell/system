{ config, lib, pkgs, ... }: {
  imports = [ ../../modules/home-manager/1password.nix ];

  home.packages = with pkgs; [
  ];
  home.sessionVariables = rec {
    #NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
    #SSL_CERT_FILE = NIX_SSL_CERT_FILE;
    #REQUESTS_CA_BUNDLE = NIX_SSL_CERT_FILE;
    #PIP_CERT = NIX_SSL_CERT_FILE;
    #GIT_SSL_CAINFO = NIX_SSL_CERT_FILE;
    #NODE_EXTRA_CA_CERTS = NIX_SSL_CERT_FILE;
  };
  programs.git = {
    enable = true;
    package = pkgs.git;
    userEmail = "mattrussell@mercury.com";
    userName = "Matthew Russell";
    extraConfig = {
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFwusIGOug/7M1ybmoueCTJyGT0GSzpUUtSZdlzm0YJR";
    };
  };
}
