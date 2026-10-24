{ ... }:
{
  programs.mise = {
    enable = true;
    enableFishIntegration = true;

    # グローバル設定は mise use --global で変更できるよう、mise 側で管理する。
  };
}
