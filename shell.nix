# Shell pined on stable channel
{ pkgs ? import (fetchTarball https://channels.nixos.org/nixos-20.03/nixexprs.tar.xz) { } }:
let
  # Date: 25 Jun 2020
  # Current commit: https://github.com/NixOS/nixpkgs-channels/archive/22a81aa5fc15b2d41b12f7160a71cd4a9f3c3fa1.tar.xz
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };

  # extensions = (with pkgs.vscode-extensions; [
  #     bbenoist.Nix
  # ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [({
  #     name = "flutter";
  #     publisher = "dart-code";
  #     version = "3.11.0";
  #     sha256 = "sha256:02c47ly7yb0bpsgr2ba17wx581baz9n1x16zb3whk321nbjawz7i";
  # })
  # ({
  #     name = "dart-code";
  #     publisher = "dart-code";
  #     version = "3.11.0";
  #     sha256 = "sha256:0rgszz5iw6ja2cjmg3vl1m1a4392rkykcw2n7xskf1pgc73kf1h0";
  # })];

  # vscode-with-extensions = pkgs.vscode-with-extensions.override {
  #     vscodeExtensions = extensions;
  # };
in
with pkgs; mkShell {

  buildInputs = [
    # vscode-with-extensions
    # unstable.flutter
    androidenv.androidPkgs_9_0.platform-tools
    androidStudioPackages.beta
    adb-sync
    sqlite
    # Nedeed to run flutter doctor on vscode
    unzip
  ];

}
