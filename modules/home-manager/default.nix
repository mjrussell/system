{ inputs, config, pkgs, ... }:
let
  homeDir = config.home.homeDirectory;
  pyEnv =
    (pkgs.python3.withPackages (ps: with ps; [ typer colorama shellingham ]));
  sysDoNixos =
    "[[ -d /etc/nixos ]] && cd /etc/nixos && ${pyEnv}/bin/python bin/do.py $@";
  sysDoDarwin =
    "[[ -d ${homeDir}/.nixpkgs ]] && cd ${homeDir}/.nixpkgs && ${pyEnv}/bin/python bin/do.py $@";
  sysdo = (pkgs.writeShellScriptBin "sysdo" ''
    (${sysDoNixos}) || (${sysDoDarwin})
  '');

in
{
  # imports = [ ./vim ./cli ./dotfiles ./git.nix ];
  imports = [ ./git.nix ./cli ];

  programs.home-manager = {
    enable = true;
    path = "${config.home.homeDirectory}/.nixpkgs/modules/home-manager";
  };

  home =
    let NODE_GLOBAL = "${config.home.homeDirectory}/.node-packages";
    in
    {
      # This value determines the Home Manager release that your
      # configuration is compatible with. This helps avoid breakage
      # when a new Home Manager release introduces backwards
      # incompatible changes.
      #
      # You can update Home Manager without changing this value. See
      # the Home Manager release notes for a list of state version
      # changes in each release.
      stateVersion = "20.09";
      sessionVariables = {
        GPG_TTY = "/dev/ttys000";
        EDITOR = "nvim";
        VISUAL = "nvim";
        CLICOLOR = 1;
        LSCOLORS = "ExFxBxDxCxegedabagacad";
      };
      sessionPath = [ "${NODE_GLOBAL}/bin" ];

      # define package definitions for current user environment
      packages = with pkgs; [
        # python with default packages
        # (pkgs.python3.withPackages
         #  (ps: with ps; [ black numpy scipy networkx matplotlib ]))
        cachix
        curl
        fd
        ffmpeg
        gawk
        git
        gnugrep
        gnupg
        gnused
        htop
        httpie
        jq
        nix
        nixfmt
        nixpkgs-fmt
        nodejs_latest
        pkgs.coreutils-full
        pre-commit
        ripgrep
        rsync
        shellcheck
      ];
    };
}
