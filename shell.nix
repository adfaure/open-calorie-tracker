# https://specific.solutions.limited/projects/hanging-plotter/android-environment.md
{ pkgs ? import (fetchTarball https://channels.nixos.org/nixos-20.09/nixexprs.tar.xz) {
  config.android_sdk.accept_license = true;
  config.allowUnfree = true; }
}:
let

  # Git revision of the channel: be42a66cd30e6bc957d919a9afbb0eb83adb6c26
  unstablePkgs = (import (builtins.fetchTarball "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz") {});
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
  })
  ({
      name = "flutter-intl";
      publisher = "localizely";
      version = "1.9.1";
      sha256 = "sha256:14a2lawvh5hzzcdxwxamjd25wzjc7d20a31zvjzn88zk3syj7i65";
  })
  ({
      name = "code-spell-checker";
      publisher = "streetsidesoftware";
      version = "1.9.0";
      sha256 = "sha256:0ic0zbv4pja5k4hlixmi6mikk8nzwr8l5w2jigdwx9hc4zhkf713";
  })
  ];

  vscode-with-extensions = unstablePkgs.vscode-with-extensions.override {
      vscodeExtensions = extensions;
  };

  # This is an ugly workaround because the author of flutter's package rename
  # flutter binary to flutter-variantname. It makes flutter undetectable for
  # editors which are looking for `flutter`.
  mkFlutter = opts: pkgs.callPackage
    (import "${pkgs.path}/pkgs/development/compilers/flutter/flutter.nix" opts) {  };

  getPatches = dir:
    let files = builtins.attrNames (builtins.readDir dir);
    in map (f: dir + ("/" + f)) files;

  flutter-dev = mkFlutter rec {
    pname = "flutter";
    channel = "stable";
    version = "1.22.3";
    filename = "flutter_linux_${version}-${channel}.tar.xz";
    sha256Hash = "sha256:1qr9fn6fmiqiv163a5zqdmni1zp5gcligm5gmm85wbsl0bghws4a";
    patches = getPatches "${pkgs.path}/pkgs/development/compilers/flutter/patches/beta";
   };

  # androidComposition = pkgs.androidenv.composeAndroidPackages {
  #   # toolsVersion = "25.2.5";
  #   # platformToolsVersion = "27.0.1";
  #   buildToolsVersions = [ "29.0.3" ];
  #   # includeEmulator = false;
  #   # emulatorVersion = "27.2.0";
  #   platformVersions = [ "29" ];
  #   # includeSources = false;
  #   # includeDocs = false;
  #   # includeSystemImages = false;
  #   # systemImageTypes = [ "default" ];
  #   # abiVersions = [ "armeabi-v7a" ];
  #   # lldbVersions = [ "2.0.2558144" ];
  #   # cmakeVersions = [ "3.6.4111459" ];
  #   # includeNDK = false;
  #   # ndkVersion = "16.1.4479499";
  #   # useGoogleAPIs = false;
  #   # useGoogleTVAddOns = false;
  #   # includeExtras = [
  #   #   "extras;google;gcm"
  #   # ];
  # };

in
pkgs.mkShell {
  buildInputs = with pkgs; [
    dart
    flutter-dev
    vscode-with-extensions

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

  shellHook=''
    export USE_CCACHE=1
    export ANDROID_JAVA_HOME=${pkgs.jdk.home}
    '';
    # export ANDROID_SDK_ROOT=
    # export ANDROID_HOME=$ANDROID_SDK_ROOT
    # export FLUTTER_SDK=${unstablePkgs.flutter.unwrapped}
}
