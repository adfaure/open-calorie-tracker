{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let

        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

      in {

        devShell = with pkgs; mkShell {
          buildInputs = with pkgs; [
            dart
            flutter
            # vscode-with-extensions

            # androidSdk
            # androidComposition.androidsdk # androidSdk
            # androidComposition.platform-tools

            android-studio
            jdk
            git
            adb-sync
            sqlite
            # Nedeed to run flutter doctor on vscode
            unzip
          ];

          shellHook = ''
            export USE_CCACHE=1
            export ANDROID_JAVA_HOME=${pkgs.jdk.home}
          '';
          # export ANDROID_SDK_ROOT=
          # export ANDROID_HOME=$ANDROID_SDK_ROOT
          # export FLUTTER_SDK=${unstablePkgs.flutter.unwrapped}
          };
      });
}
