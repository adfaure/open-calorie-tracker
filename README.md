# Running the application on Nixos

Enter into the shell.

```
NIXPKGS_ALLOW_UNFREE=1 ns shell_test.nix
```

## Run on your phone

Launch the android server: `adb start-server`.
Then to run the application on your phone, use in a terminal: `flutter run`

## Start emulator with android-studio

launch android-studio and configure+lauch an emulator.

## Launching on emulator  (**WIP**)

To build the emulator use: `nix-build emulate.nix`.
Then start the emulator: `./result/bin/run-test-emulator`.

# Notes

- For some reasons, accepting adroid license causes `allowUnfree = true`, one quick workaround is to run the shell with: `NIXPKGS_ALLOW_UNFREE=1 nix-shell shell_test.nix`.
- If database not working with dlopen failing this link might fix it: https://stackoverflow.com/a/62308661