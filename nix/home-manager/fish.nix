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
	  rev = "c5efbe05aed81b201454c0ae1190ba91ea1970ac";
	  sha256 = "sha256-12Xd43vy6qQILV/Q5BeoGaul6DsQv5OloCPLXwR6KNU=";
	};
      }
    ];
  };
}
