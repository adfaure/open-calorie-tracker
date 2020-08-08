{ pkgs ? import (fetchTarball https://channels.nixos.org/nixos-20.03/nixexprs.tar.xz) {
    config.android_sdk.accept_license = true;
  }
}:

pkgs.androidenv.emulateApp {
  name = "emulate-MyAndroidApp";
  platformVersion = "30";
  abiVersion = "x86_64"; # armeabi-v7a, mips, x86
  systemImageType = "google_apis_playstore";
}
