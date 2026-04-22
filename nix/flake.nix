{
  description = "Home Manager configuration of ryu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # coedexの脆弱性対応のため、新しいバージョンが入っているnixos-unstableを選択するために指定
    # nixpkgs-unstalbeでも0.119.0以上のバージョンが入ったならcodex用にnixos-unstalbeとするのはやめる
    nixpkgs-codex.url = "github:NixOS/nixpkgs/nixos-unstable";
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
      nixpkgs-codex,
      home-manager,
      nix-darwin,
      nix-homebrew,
      ...
    }:
    {
      darwinConfigurations."ryumacbookairm5" = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit self nix-homebrew nixpkgs-codex;
        };
        modules = [
          ./nix-darwin/configuration.nix
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
        ];
      };
    };
}
