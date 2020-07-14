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

- For some reasons, accepting android license causes `allowUnfree = true`, one quick workaround is to run the shell with: `NIXPKGS_ALLOW_UNFREE=1 nix-shell shell_test.nix`.
- If database not working with dlopen failing this link might fix it: https://stackoverflow.com/a/62308661
- I am interested to learn about the Bloc pattern. Looks like this article is a good entry point: https://www.didierboelens.com/2018/08/reactive-programming-streams-bloc/.

# Todo

- Use user preferences to be able to choose the calorie objective.
- Create a foodView page to be able to modify a food.
- Find a way to be able to modify/delete food that have been consumed (a visibility bool on the food table can do the trick).
- Implement swapping gesture to change day in the journal.
- Make the connection with openfood fact to automatically get food's informations.
- Find the best way to select aliments, portion or number of gramme etc
- Localize the application eng/fr.
- Add food details (lipid, iron etc)
