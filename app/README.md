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

## Project structure and conventions

```
app/
├── lib/
│   ├── main.dart                 # entry point only
│   └── src/
│       ├── app.dart              # NaVrhApp: root widget, theme
│       ├── home_screen.dart      # placeholder screen
│       ├── app_router.dart       # later (ticket 1.13)
│       ├── core/                 # shared helpers with no feature knowledge
│       ├── data/
│       │   └── database/         # Drift database, tables, migrations
│       └── features/
│           └── <feature>/
│               ├── data/         # repositories, database access
│               ├── domain/       # plain Dart models and pure logic (unit-tested)
│               └── presentation/ # screens, widgets, Riverpod providers
└── test/
    ├── helpers/                  # shared test helpers, not mirrored from lib
    └── src/                      # mirrors lib/src/
```

Folders are created by the first ticket that needs them, so `core/`, `data/database/` and `features/` do not exist yet.

- **The app layer:** `main.dart` and the files at the top of `lib/src/` (`app.dart`, `home_screen.dart`, later `app_router.dart`). It composes features and may import them. Features and `core/` never import it.
- **Home is not a feature.** The current home screen is a placeholder. Its real content will come from other features, so it lives in the app layer. When the designs are decided, it either becomes one feature's screen or stays an app-level shell.
- **Layers inside a feature:**
  - `data/`: repositories and database access.
  - `domain/`: plain Dart models and pure logic (no Flutter, no Drift imports), so it can be unit-tested directly.
  - `presentation/`: screens, widgets, and Riverpod providers.
- **Boundaries:** a feature may use `core/` and `data/database/`. It does not import another feature's `presentation/`. Shared logic between features moves down into `core/`.
- **Imports:** package imports (`package:na_vrh/src/...`), not relative paths, across folders.
- **Why `src/`:** it keeps `lib/` to a single entry file and matches the Dart package layout. Nothing outside the app imports it, so it is a layout choice, not a privacy boundary.
- **Tests:** a test mirrors its source path. `lib/src/x.dart` is tested by `test/src/x_test.dart`. Shared helpers (provider overrides, in-memory database, router pumping) live in `test/helpers/`. `main.dart` has no test, since it only calls `runApp`.
- **Files:** snake_case names, one main public class per file.

## Package ID

`xyz.imkaem.navrh` on both Android and iOS.
