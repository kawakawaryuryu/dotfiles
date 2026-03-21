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

    casks = [
      "google-chrome"
    ];
  };
}
