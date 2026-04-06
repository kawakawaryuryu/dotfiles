{
  self,
  lib,
  pkgs,
  ...
}:
{
  users.users.ryu = {
    home = "/Users/ryu";
    shell = pkgs.fish;
  };

  environment.shells = [
    pkgs.fish
  ];

  programs.fish.enable = true;

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "1password-cli"
    ];
  };
  nix.enable = false;

  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = "ryu";

    defaults = {
      dock.autohide = true;
      NSGlobalDomain = {
        # リピート入力認識までの時間
        InitialKeyRepeat = 12;
        # キーのリピート速度
        KeyRepeat = 2;
      };

      # 調べるを3本指でタップ
      trackpad.TrackpadThreeFingerTapGesture = 2;

      # メニューバーの日付を秒まで表示
      menuExtraClock.ShowSeconds = true;

      CustomUserPreferences = {
        # キーボードショートカット
        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
            # 「Spotlight検索を表示」を⌥+Spaceに
            "64" = {
              enabled = true;
              value = {
                parameters = [
                  32
                  49
                  524288
                ];
                type = "standard";
              };
            };
            # 前の入力ソースを⌘+Spaceで選択
            "60" = {
              enabled = true;
              value = {
                parameters = [
                  32
                  49
                  1048576
                ];
                type = "standard";
              };
            };
            # Siriをfn+sで呼ぶ
            "176" = {
              enabled = false;
              value = {
                type = "SAE1.0";
              };
            };
          };
        };
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

    # 起動時のサウンドをオフ
    startup.chime = false;
  };

  # ログイン時に起動
  launchd.user.agents = {
    chrome.serviceConfig = {
      ProgramArguments = [
        "/usr/bin/open"
        "-a"
        "Google Chrome"
      ];
      RunAtLoad = true;
    };

    terminal.serviceConfig = {
      ProgramArguments = [
        "/usr/bin/open"
        "-a"
        "Ghostty"
      ];
      RunAtLoad = true;
    };

    rectangle.serviceConfig = {
      ProgramArguments = [
        "/usr/bin/open"
        "-a"
        "Rectangle"
      ];
      RunAtLoad = true;
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users."ryu" = ../home-manager/home.nix;
  };

  imports = [
    ./homebrew.nix
  ];
}
