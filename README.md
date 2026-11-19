# na_vrh

A mobile app for logging mountain summits. The user plans a climb, and on the summit taps a button. The app reads GPS and checks whether they reached the peak they planned. It works fully offline.

This repository is a monorepo.

## Repository layout

```
na_vrh/
├── app/              # Flutter app (see app/README.md)
├── tools/            # Dart tooling, e.g. the peak data pipeline (planned)
├── project/          # Product spec, epics, tickets, todo, design mockups
├── .fvmrc            # Flutter version pin for every Dart/Flutter package here
├── CLAUDE.md         # Development workflow and conventions
└── README.md         # This file
```

Project documents:

- [project/SPEC.md](project/SPEC.md): product spec and decisions
- [project/epics.md](project/epics.md): epic list
- [project/tickets/](project/tickets/): one file per ticket
- [project/todo.md](project/todo.md): unscheduled todos

The development workflow (atomic units, one feature branch per ticket) is described in [CLAUDE.md](CLAUDE.md).

## Flutter version (FVM)

The Flutter version is managed with [FVM](https://fvm.app/install) and pinned once, in [.fvmrc](.fvmrc) at the repository root. Every Dart and Flutter package in the repo (`app/`, and future ones such as `tools/` or a server) uses that same version. FVM finds the pin from any folder inside the repo.

### Setup

1. Install [FVM](https://fvm.app/install).
2. From anywhere in the repo, install the pinned version:

   ```bash
   fvm install
   ```

3. Always use `fvm flutter ...` and `fvm dart ...` instead of plain `flutter` and `dart`, so the pinned version is used.

IDEs: `fvm use` and `fvm install` keep `.vscode/settings.json` pointing VS Code at the pinned SDK (`dart.flutterSdkPath`). In other IDEs, point the Flutter SDK path at `.fvm/versions/<version>` in the repo root.

### Updating the Flutter version

Run from the repository root:

```bash
fvm install <version>      # optional: download it first
fvm use <version> --force
```

`--force` is required because the repo root is not a Flutter project (it has no `pubspec.yaml`), and `fvm use` otherwise refuses or waits for a prompt.

Then:

1. Commit the changed `.fvmrc`, and `.vscode/settings.json` if it changed.
2. In each package, run `fvm flutter pub get`, then its tests and `fvm flutter analyze`.

## Getting started

To run the app, see [app/README.md](app/README.md).
