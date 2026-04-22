{
  description = "Home Manager configuration of ryu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # 基本的にはnixpkgsを使うが、一部アプリケーションに関してnixos-unstable側にバージョンアップされたものが入ってることもあるため有効化
    nixpkgs-nixos.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-nixos,
      home-manager,
      nix-darwin,
      nix-homebrew,
      ...
    }:
    {
      darwinConfigurations."ryumacbookairm5" = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit self nix-homebrew nixpkgs-nixos;
        };
        modules = [
          ./nix-darwin/configuration.nix
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
        ];
      };
    };
}
