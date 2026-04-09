{ pkgs, ... }:
{
  home.shell.enableFishIntegration = true;
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "bobthefish";
	src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
	  repo = "theme-bobthefish";
	  rev = "";
	  sha256 = "c5efbe05aed81b201454c0ae1190ba91ea1970ac";
	};
      }
    ];
  };
}
