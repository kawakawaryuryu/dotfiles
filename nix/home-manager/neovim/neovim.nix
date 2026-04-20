{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      LazyVim
    ];
  };

  xdg.configFile."nvim".source = ./config
}
