# Open Calorie Tracker

![Screenshot](img/journal_demo.jpg)

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

- Create a first login page, to enter user informations such as the objective.
    - The inititialisation of the appliacation allows to create the initialisation date.
      The init date is then used as the first date the user can navigate from, and ensure the consistency of the objective data.
- Create a foodView page to be able to modify a food.
- Find a way to be able to modify/delete food that have been consumed.
- Implement swapping gesture to change day in the journal.
- Find the best way to select aliments, portion or number of gramme etc
- Localize the application eng/fr.
- Add food details (lipid, iron etc)