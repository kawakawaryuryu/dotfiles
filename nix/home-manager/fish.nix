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
	  # 一度未指定にしてsudo darwin-rebuild switch --flake .を実行してエラーに表示されたsha256値をコピーしている
	  sha256 = "sha256-12Xd43vy6qQILV/Q5BeoGaul6DsQv5OloCPLXwR6KNU=";
	};
      }
    ];
  };

  xdg.configFile."fish/conf.d/bobthefish.fish".text = ''
    set -g theme_newline_cursor yes
    set -g theme_nerd_fonts yes
    set -g theme_color_scheme terminal
  '';
}
