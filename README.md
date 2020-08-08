# Open Calorie Tracker

OCT is a similar to my any calorie tracking applications.
You can enter any food you eat, and get a daily summary of your calories.
It is possible to create foods that you can reuse when you need it, or directly scan the barcode of your products.

**All your data stays on your phone**, nothing is send to a tier server.

![Screenshot](./img/journal_demo.jpg)

# Running the application on Nixos

Enter into the shell.

```
NIXPKGS_ALLOW_UNFREE=1 ns shell_test.nix
```

## Run on your phone

Launch the android server: `adb start-server`.
Then to run the application on your phone, use in a terminal: `flutter run`

## Start emulator with android-studio

launch android-studio and configure+lauch an emulator.

## Launching on emulator  (**WIP**)

To build the emulator use: `nix-build emulate.nix`.
Then start the emulator: `./result/bin/run-test-emulator`.

# Notes

- For some reasons, accepting android license causes `allowUnfree = true`, one quick workaround is to run the shell with: `NIXPKGS_ALLOW_UNFREE=1 nix-shell shell_test.nix`.
- If database not working with dlopen failing this link might fix it: https://stackoverflow.com/a/62308661
- I am interested to learn about the Bloc pattern. Looks like this article is a good entry point: https://www.didierboelens.com/2018/08/reactive-programming-streams-bloc/.

# Icon

Update icon:

```
To change the icon of the application:
```



# Deploy


The application bundle can be created with:

```
flutter build appbundle --target-platform android-arm,android-arm64,android-x64
```

To create the bundle to test doployement:
In the `shell.nix`, we have can inlude the android sdk containing the `aapt2` application.

```
androidSdk = pkgs.androidenv.androidPkgs_9_0.androidsdk;
```

Once we got the path to the `aapt2` binary we can call the bundletool with the proper aapt2 path.

```
java -jar bundletool-all-1.0.0.jar build-apks --bundle=build/app/outputs/bundle/release/app-release.aab --output=build/foodassistant/food_assistant.apks --aapt2=/nix/store/g91h4jyn5dj35xvlfch2z5h3d08mx7dh-androidsdk/libexec/android-sdk/build-tools/28.0.3/aapt2`
```

# Todo

- Create a first login page, to enter user informations such as the objective.
    - The inititialisation of the appliacation allows to create the initialisation date.
      The init date is then used as the first date the user can navigate from, and ensure the consistency of the objective data.
- Find the best way to select aliments, portion or number of gramme etc
- Localize the application eng/fr.
- Add food details (lipid, iron etc)
- Packages the application with Nix?
- Check for internet connection before scanning product.