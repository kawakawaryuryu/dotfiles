{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableFishIntegration = true;
    #settings = {
    #  command = "/etc/profiles/per-user/ryu/bin/fish";
    #};
  };
}
