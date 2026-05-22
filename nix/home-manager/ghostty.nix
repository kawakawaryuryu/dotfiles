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
      # 選択した箇所を自動でクリップボードにコピー
      copy-on-select = "clipboard";

      # split間の移動
      keybind = "cmd+opt+h=goto_split:left"
      keybind = "cmd+opt+j=goto_split:down"
      keybind = "cmd+opt+k=goto_split:up"
      keybind = "cmd+opt+l=goto_split:right"

      # splitサイズ変更
      keybind = "cmd+ctrl+h=resize_split:left,10"
      keybind = "cmd+ctrl+j=resize_split:down,10"
      keybind = "cmd+ctrl+k=resize_split:up,10"
      keybind = "cmd+ctrl+l=resize_split:right,10"

      # splitサイズを均等化
      keybind = "cmd+ctrl+e=equalize_splits"
    };
  };
}
