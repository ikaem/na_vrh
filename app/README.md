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

## Code generation

Riverpod providers are written with the `@riverpod` annotation, and `build_runner` generates the matching `*.g.dart` files. Drift uses the same tool for the database code.

```bash
fvm dart run build_runner build    # generate once (the first run takes about 30 seconds)
fvm dart run build_runner watch    # regenerate on every change while developing
```

- Generated files are committed, in the same commit as the annotated file that produces them. A fresh clone runs and tests without a codegen step.
- After changing annotated code, regenerate and commit the result together with it. A stale generated file is easy to miss, so always regenerate before committing.
- Generated files are excluded from analysis (see `analysis_options.yaml`).

## Dates

Dates are stored as UTC and read back as UTC.

- `app/build.yaml` sets Drift's `store_date_time_values_as_text: true`, so every `DateTime` column is stored as ISO-8601 UTC text, for example `2026-01-02T03:04:05.678009Z`. The same instant comes back as a UTC `DateTime`, with milliseconds and microseconds intact.
- Drift's default is integer seconds, which drops the sub-second part and reads back as local time. That would break the spec's "always UTC" rule, so do not remove the option.
- Pass UTC values when writing (`DateTime.now().toUtc()`). Convert to local time only at the display edge.
- SQL compares dates as text. UTC ISO strings sort correctly, so ordering and range queries work as expected.

## State management

State is managed with [Riverpod](https://riverpod.dev), using code generation.

- **Writing providers:** use the `@riverpod` annotation.
  - A function for a simple or read-only provider. A class (a notifier) when there is state with methods.
  - Parameters are plain function arguments, and generate a family provider (`xyzProvider(arg)`).
  - Annotated functions take a plain `Ref ref`.
  - Each file with annotated providers has a `part 'name.g.dart';` line.
  - Do not use the legacy provider types. The package keeps them behind a separate `legacy.dart` import, so do not import that.
- **Where providers live:**
  - Repository and service providers go in the feature's `data/`. The database provider goes in `data/database/`.
  - UI state providers go in `presentation/`.
  - `domain/` never imports Riverpod. It stays plain Dart.
- **The root:** `main.dart` runs the app inside a `ProviderScope`.
- **Tests:** override providers with `ProviderScope(overrides: [...])` in widget tests, and `ProviderContainer(overrides: [...])` in unit tests.

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
│               ├── data/         # repositories, database access, their Riverpod providers
│               ├── domain/       # plain Dart models and pure logic (unit-tested)
│               └── presentation/ # screens, widgets, UI state providers
└── test/
    ├── helpers/                  # shared test helpers, not mirrored from lib
    └── src/                      # mirrors lib/src/
```

Folders are created by the first ticket that needs them, so `core/`, `data/database/` and `features/` do not exist yet.

- **The app layer:** `main.dart` and the files at the top of `lib/src/` (`app.dart`, `home_screen.dart`, later `app_router.dart`). It composes features and may import them. Features and `core/` never import it.
- **Home is not a feature.** The current home screen is a placeholder. Its real content will come from other features, so it lives in the app layer. When the designs are decided, it either becomes one feature's screen or stays an app-level shell.
- **Layers inside a feature:**
  - `data/`: repositories, database access, and the Riverpod providers that expose them.
  - `domain/`: plain Dart models and pure logic (no Flutter, Drift or Riverpod imports), so it can be unit-tested directly.
  - `presentation/`: screens, widgets, and UI state providers.
- **Boundaries:** a feature may use `core/` and `data/database/`. It does not import another feature's `presentation/`. Shared logic between features moves down into `core/`.
- **Imports:** package imports (`package:na_vrh/src/...`), not relative paths, across folders.
- **Why `src/`:** it keeps `lib/` to a single entry file and matches the Dart package layout. Nothing outside the app imports it, so it is a layout choice, not a privacy boundary.
- **Tests:** a test mirrors its source path. `lib/src/x.dart` is tested by `test/src/x_test.dart`. Shared helpers (provider overrides, in-memory database, router pumping) live in `test/helpers/`. `main.dart` has no test, since it only calls `runApp`.
- **Files:** snake_case names, one main public class per file.

## Package ID

`xyz.imkaem.navrh` on both Android and iOS.
