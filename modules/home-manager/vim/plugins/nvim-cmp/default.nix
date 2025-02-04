{ config, pkgs, lib, ... }: {
  programs.neovim =
    let inherit (lib.vimUtils ./.) readLuaSection pluginWithLua;
    in
    {
      plugins = with pkgs.vimPlugins; [
        (pluginWithLua {
          plugin = nvim-cmp;
          file = "nvim-cmp";
        })
        vim-vsnip
        vim-vsnip-integ
      ];
    };
}
