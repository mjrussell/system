{ config, pkgs, lib, ... }:
let
  functions = builtins.readFile ./functions.sh;
  fuzz =
    let fd = "${pkgs.fd}/bin/fd";
    in
    rec {
      defaultCommand = "${fd} -H --type f";
      defaultOptions = [ "--height 50%" ];
      fileWidgetCommand = "${defaultCommand}";
      fileWidgetOptions = [
        "--preview '${pkgs.bat}/bin/bat --color=always --plain --line-range=:200 {}'"
      ];
      changeDirWidgetCommand = "${fd} --type d";
      changeDirWidgetOptions =
        [ "--preview '${pkgs.tree}/bin/tree -C {} | head -200'" ];
      historyWidgetOptions = [ ];
    };
  aliases = (lib.optionalAttrs pkgs.stdenvNoCC.isDarwin {
    # darwin specific aliases
    ibrew = "arch -x86_64 brew";
    abrew = "arch -arm64 brew";
    z = "j";
  });
in
{
  home.packages = [ pkgs.tree ];
  programs = {
    autojump = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    } // fuzz;
    bat = {
      enable = true;
      config = {
        theme = "TwoDark";
        color = "always";
      };
    };
    jq.enable = true;
    htop.enable = true;
    gpg.enable = true;
    bash = {
      enable = true;
      shellAliases = aliases;
      initExtra = ''
        ${functions}
      '';
    };
    nix-index.enable = false;
    starship = {
      enable = true;
      package = pkgs.stable.starship;
      settings = {
        format = lib.concatStrings [
           "$username"
           "$hostname"
           "$localip"
           "$directory"
           "$git_branch"
           "$git_commit"
           "$git_state"
           "$git_metrics"
           "$git_status"
           "$nix_shell"
           "$aws"
           "$cmd_duration"
           "$character"
         ];

         git_status = {
           stashed = "";
         };
      };
    };
    zsh =
      let
        mkZshPlugin = { pkg, file ? "${pkg.pname}.plugin.zsh" }: rec {
          name = pkg.pname;
          src = pkg.src;
          inherit file;
        };
      in
      {
        enable = true;
        autocd = true;
        dotDir = ".config/zsh";
        localVariables = {
          LANG = "en_US.UTF-8";
          GPG_TTY = "/dev/ttys000";
          DEFAULT_USER = "${config.home.username}";
          CLICOLOR = 1;
          LS_COLORS = "ExFxBxDxCxegedabagacad";
          TERM = "xterm-256color";
        };
        shellAliases = aliases;
        initExtra = ''
          ${functions}
          ${lib.optionalString pkgs.stdenvNoCC.isDarwin ''
            if [[ -d /opt/homebrew ]]; then
              eval "$(/opt/homebrew/bin/brew shellenv)"
            fi
          ''}
          unset RPS1
          bindkey '^ ' autosuggest-accept
        '';
        profileExtra = ''
          ${lib.optionalString pkgs.stdenvNoCC.isLinux "[[ -e /etc/profile ]] && source /etc/profile"}
        '';
        plugins = with pkgs; [
          {
             name = "zsh-nix-shell";
             file = "nix-shell.plugin.zsh";
             src = pkgs.fetchFromGitHub {
               owner = "chisui";
               repo = "zsh-nix-shell";
               rev = "v0.5.0";
               sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
             };
           }
          (mkZshPlugin { pkg = zsh-autopair; })
          (mkZshPlugin { pkg = zsh-completions; })
          (mkZshPlugin { pkg = zsh-autosuggestions; })
          (mkZshPlugin {
            pkg = zsh-fast-syntax-highlighting;
            file = "fast-syntax-highlighting.plugin.zsh";
          })
          (mkZshPlugin { pkg = zsh-history-substring-search; })
        ];
        oh-my-zsh = {
          enable = true;
          plugins = [ "git" "sudo" ];
        };
      };
  };
}
