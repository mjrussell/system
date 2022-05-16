{ inputs, config, lib, pkgs, ... }: {
  imports = [ ./primary.nix ./nixpkgs.nix ./overlays.nix ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    interactiveShellInit = ''
      # Todo move to homemanager/darwin section
      export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
      export PATH="/opt/homebrew/bin:$PATH"
      export PATH="/$HOME/.rd/bin:$PATH"
      export LDFLAGS="-L/opt/homebrew/opt/postgresql@12/lib"
      export CPPFLAGS="-I/opt/homebrew/opt/postgresql@12/include"
    '';
  };

  user = {
    description = "Matthew Russell";
    home = "${
        if pkgs.stdenvNoCC.isDarwin then "/Users" else "/home"
      }/${config.user.name}";
    shell = pkgs.zsh;
  };

  # bootstrap home manager using system config
  hm = import ./home-manager;

  # let nix manage home-manager profiles and use global nixpkgs
  home-manager = {
    extraSpecialArgs = { inherit inputs lib; };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };

  # environment setup
  environment = {
    systemPackages = with pkgs; [
      # editors
      neovim

      # standard toolset
      autojump
      awscli2
      coreutils-full
      curl
      gettext
      wget
      git
      jq

      # helpful shell stuff
      bat
      fzf
      ripgrep

    ];
    etc = {
      home-manager.source = "${inputs.home-manager}";
      nixpkgs.source = "${pkgs.path}";
      stable.source = "${inputs.stable}";
    };
    # list of acceptable shells in /etc/shells
    shells = with pkgs; [ bash zsh ];
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
