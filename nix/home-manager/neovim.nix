{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      LazyVim
      #which-key-nvim
    ];
  };
}
