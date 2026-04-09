{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableFishIntegration = true;
    # chsh -s /run/current-system/sw/bin/fishによって有効化しているためコメントアウト
    #settings = {
    #  command = "/etc/profiles/per-user/ryu/bin/fish";
    #};
  };
}
