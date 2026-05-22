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

      keybind = [
        # split間の移動
        "cmd+opt+h=goto_split:left"
        "cmd+opt+j=goto_split:down"
        "cmd+opt+k=goto_split:up"
        "cmd+opt+l=goto_split:right"

        # splitサイズ変更
        "cmd+ctrl+h=resize_split:left,10"
        "cmd+ctrl+j=resize_split:down,10"
        "cmd+ctrl+k=resize_split:up,10"
        "cmd+ctrl+l=resize_split:right,10"

        # splitサイズを均等化
        "cmd+ctrl+e=equalize_splits"
      ];
    };
  };
}
