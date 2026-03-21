{
  nix-homebrew,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    user = "ryu";
    enableRosetta = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    user = "ryu";

    global.autoUpdate = false;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      # cleanup = "uninstall";  # Homebrew からの移行完了後に設定
    };

    casks = [
      "google-chrome"
    ];
  };
}
