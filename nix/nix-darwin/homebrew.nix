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
    };

    casks = [
      "google-chrome"
      "google-drive"
      "google-japanese-ime"
      "alfred"
      "dropbox"
    ];
  };
}
