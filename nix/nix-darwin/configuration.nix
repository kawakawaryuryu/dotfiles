{
  self,
  lib,
  ...
}:
{
  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = "ryu";

    defaults = {
      dock.autohide = true;
      NSGlobalDomain = {
        InitialKeyRepeat = 12;
        KeyRepeat = 2;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      userKeyMapping =
        let
          mkKeyMapping =
            let
              hexToInt = lib.trivial.fromHexString;
            in
            src: dst: {
              HIDKeyboardModifierMappingSrc = hexToInt src;
              HIDKeyboardModifierMappingDst = hexToInt dst;
            };
          # Key-map References:
          #   https://developer.apple.com/library/archive/technotes/tn2450/_index.html
          # e.g.
          #   07000 = Keyboard, 000E0 = Keyboard Left Control
          #     -> 0x7000000E3 = Keyboard Left Command
          # macOS Fn key:
          #   https://apple.stackexchange.com/questions/340607/what-is-the-hex-id-for-fn-key%EF%BC%89
          leftControl = "0x7000000E0";
          leftCommand = "0x7000000E3";
          capsLock = "0x700000039";
          fnKey = "0xFF00000003";
        in
        [
          # Left Control <-> Caps Lock
          (mkKeyMapping leftControl capsLock)
          (mkKeyMapping capsLock leftControl)
        ];
    };
  };


  users.users.ryu.home = "/Users/ryu";

  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.enable = false;

  programs.fish.enable = true;

  security.pam.services.sudo_local.touchIdAuth = true;
}
