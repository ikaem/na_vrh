# na_vrh app

Flutter app for logging mountain summits. Android is the target for now. The `ios/` folder is generated so it is ready later, but iOS is not built or tested yet.

The Flutter version is pinned for the whole repository. Install FVM and the pinned version first, as described in the [root README](../README.md#flutter-version-fvm), and use `fvm flutter ...` for every command below.

## Requirements

- Android Studio or the Android SDK command-line tools, and an Android device or emulator.
- A JDK, version 17 or newer. Android Studio includes one. If you only use the command-line tools, install a JDK separately and make sure `JAVA_HOME` is set.

## Setup

From the `app/` folder:

```bash
fvm flutter pub get    # installs the Dart dependencies
```

## Run

Start an emulator or connect a device, then:

```bash
fvm flutter run
```

In VS Code, use the `na_vrh (debug)` launch configuration instead.

## Test and check

```bash
fvm flutter test       # run all tests
fvm flutter analyze    # static analysis
fvm dart format .      # format the code
```

## Package ID

`xyz.imkaem.navrh` on both Android and iOS.
