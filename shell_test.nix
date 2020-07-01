# https://specific.solutions.limited/projects/hanging-plotter/android-environment.md
{ pkgs ? import (fetchTarball https://channels.nixos.org/nixos-20.03/nixexprs.tar.xz) { } }:
let
  # flutterPkgs = (import (builtins.fetchTarball "https://github.com/babariviere/nixpkgs/archive/flutter-testing.tar.gz")  {});
  unstablePkgs    = (import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz")   {});
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    unstablePkgs.flutter
    unstablePkgs.android-studio
    # abd
    androidenv.androidPkgs_9_0.platform-tools
    jdk
    git
    adb-sync
    sqlite
    # Nedeed to run flutter doctor on vscode
    unzip
  ];

  shellHook=''
    export USE_CCACHE=1
    export ANDROID_JAVA_HOME=${pkgs.jdk.home}
    export ANDROID_SDK_ROOT="~/Android/Sdk"
    export ANDROID_HOME=$ANDROID_SDK_ROOT
    export FLUTTER_SDK=${unstablePkgs.flutter.unwrapped}
  '';
    # flutter config --android-sdk "~/Android/Sdk"
}
