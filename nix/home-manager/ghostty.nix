{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableFishIntegration = true;
    settings = {
      # chsh -s /run/current-system/sw/bin/fishによって有効化しているためコメントアウト
      #command = "/etc/profiles/per-user/ryu/bin/fish";

      # 背景の透明度
      background-opacity = 0.9;

      # hotkey
      keybind = "global:cmd+backquote=toggle_quick_terminal";
    };
  };
}
