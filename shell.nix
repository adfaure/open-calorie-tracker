# https://specific.solutions.limited/projects/hanging-plotter/android-environment.md
{ pkgs ? import (fetchTarball https://channels.nixos.org/nixos-20.03/nixexprs.tar.xz) {
    config.android_sdk.accept_license = true;
  }
}:
let
  allowUnfree = true;
  # flutterPkgs = (import (builtins.fetchTarball "https://github.com/babariviere/nixpkgs/archive/flutter-testing.tar.gz")  {});
  unstablePkgs = (import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz")   {});
  extensions = (with unstablePkgs.vscode-extensions; [
      bbenoist.Nix
  ]) ++ unstablePkgs.vscode-utils.extensionsFromVscodeMarketplace [({
      name = "flutter";
      publisher = "dart-code";
      version = "3.11.0";
      sha256 = "sha256:02c47ly7yb0bpsgr2ba17wx581baz9n1x16zb3whk321nbjawz7i";
  })
  ({
      name = "dart-code";
      publisher = "dart-code";
      version = "3.11.0";
      sha256 = "sha256:0rgszz5iw6ja2cjmg3vl1m1a4392rkykcw2n7xskf1pgc73kf1h0";
  })];

  vscode-with-extensions = unstablePkgs.vscode-with-extensions.override {
      vscodeExtensions = extensions;
  };

  # This is an ugly workaround because the author of flutter's package rename
  # flutter binary to flutter-variantname, which make flutter undetectable for
  # editors which are looking for `flutter`.
  mkFlutter = opts: pkgs.callPackage
    (import "${unstablePkgs.path}/pkgs/development/compilers/flutter/flutter.nix" opts) { };

  getPatches = dir:
    let files = builtins.attrNames (builtins.readDir dir);
    in map (f: dir + ("/" + f)) files;

  flutter-dev = mkFlutter rec {
    pname = "flutter";
    channel = "stable";
    version = "1.17.5";
    filename = "flutter_linux_${version}-${channel}.tar.xz";
    sha256Hash = "sha256:0kapja3nh7dfhjbn2np02wghijrjnpzsv4hz10fj54hs8hdx19di";
    patches = getPatches "${unstablePkgs.path}/pkgs/development/compilers/flutter/patches/beta";
 };

  androidSdk = pkgs.androidenv.androidPkgs_9_0.androidsdk;

in
pkgs.mkShell {
  buildInputs = with pkgs; [
    unstablePkgs.dart
    flutter-dev
    vscode-with-extensions
    # unstablePkgs.flutterPackages.dev
    unstablePkgs.android-studio

    # androidSdk

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
    # export ANDROID_SDK_ROOT=${androidSdk}/libexec/android-sdk
    # export ANDROID_HOME=$ANDROID_SDK_ROOT
    export FLUTTER_SDK=${unstablePkgs.flutter.unwrapped}
  '';
}
