# na_vrh - Implementation Guide

## Project overview

**na_vrh** is a mobile app for logging mountain summits. The user plans a climb, optionally presses Start at the trailhead, and on the summit taps a button. The app reads GPS and checks whether they reached the peak they planned. Photos can be attached, and a history screen lists everything they have climbed.

It is a personal tool first. It must work fully offline, because summits often have no signal.

## Where things live

```
na_vrh/
├── CLAUDE.md          # This file
├── app/               # Flutter app (Android target, iOS folder generated)
├── tools/
│   └── peak_pipeline/ # Dart script that builds the bundled peaks file (epic 2)
└── project/
    ├── SPEC.md        # Product spec and decisions (source of truth)
    ├── epics.md       # Epic list with dependencies
    ├── todo.md        # Unscheduled todos, including "decide designs"
    ├── tickets/       # One markdown file per ticket
    └── design/        # HTML design mockups
```

This is a monorepo. A server or a watch app, if built later, get their own top-level folders.

Read `project/SPEC.md` before making product or data-model decisions. It is the source of truth. If a decision changes, update the spec in the same session.

## Tech stack

- Flutter (Dart), Android is the target. The `ios/` folder is generated but iOS is not built or tested yet.
- Flutter version pinned with FVM, in a single `.fvmrc` at the repo root shared by every Dart and Flutter package. Use `fvm flutter ...` and `fvm dart ...`, not plain `flutter` or `dart`.
- Drift (SQLite) for the local database, with versioned migrations.
- Riverpod for state management, with code generation (`riverpod_generator`). Generate with `fvm dart run build_runner build` (or `watch` while developing). See `app/README.md`.
- go_router for navigation.
- Package ID: `xyz.imkaem.navrh`.
- A Makefile wraps the common commands (run, test, build) once it exists.

## Atomic development (always on for this project)

Work is done in atomic units, not in whole tickets.

**The loop:**
1. Write one atomic unit: a single self-contained, reviewable piece (one function, component, module, or one layer of a feature), plus its matching test, TDD-style, scoped to just that unit.
2. Report what was created and why: the intent, the key decisions, and how the test covers it.
3. Suggest a commit message for the unit (see Commit message format), then stop and hand off for review.
4. The user commits. Claude never does.
5. Wait for "continue" (or similar), then pick up the next unit.

**Standing rules:**
- A ticket is not a unit. One ticket usually splits into several units, each with its own stop and commit.
- Each unit must be small enough to review in one sitting.
- A single commit may change only one production file, plus its directly matching test file when the unit has real logic. A generated `*.g.dart` file is committed in the same commit as the file that produces it and does not count as a second production file. Generated files are committed, so regenerate before committing.
- No jumping ahead and no batching. A type, the code that consumes it, and the UI that renders it are separate units in separate commits.
- At every stop, give a suggested commit message. Do not include a `Co-Authored-By` line (or any other attribution trailer) in suggested commit messages. Never run `git commit`, `git push`, or PR commands unless explicitly told to. The only exception is creating and checking out an approved ticket branch (see Branching).
- Start from shared, foundational pieces that are needed whatever the design turns out to be, so nothing gets thrown away later.
- Docs and planning files (the spec, epics, tickets, todo) are not code. They are not subject to the one-file-per-commit rule.

**Before each unit**, briefly say:
1. The ticket ID (for example 1.7).
2. What is being built.
3. How it fits into the ticket and epic.
4. Which file(s) will change.

**After each unit**, summarize what was done, the files modified, and the diff (`git diff` or `git status`), and end with a suggested commit message.

## Branching (one feature branch per ticket)

Before starting work on a ticket, work happens on a dedicated feature branch, never on `master`.

1. Propose a branch name to the developer and wait for approval of the name. The name is based on the ticket, using its ID and title in kebab-case, for example `1.1-create-flutter-project`.
2. Only after the name is approved: create the branch from `master` and check it out.
3. Do all of the ticket's work on that branch only.

Rules:
- Do not write any code or change any files for a ticket before the branch exists and is checked out.
- Always branch from `master`, not from another ticket's branch.
- Creating and checking out the approved branch is the one git write operation Claude may do without being asked again. Committing, pushing, merging, and PRs still follow the atomic development rules above: the user does them.
- Docs and planning files (spec, epics, tickets, todo, this file) that are not part of implementing a ticket can be edited without a ticket branch.

## Testing

- TDD for anything with real logic: domain code, repositories, parsers, the pipeline script, state transitions. The test is written first, and it lives in the same commit as the code it covers.
- Pure wiring and static UI (an empty screen, a plain layout) don't need tests.
- Structure every test body with `// given`, `// when`, `// then` comments marking the setup, the action under test, and the assertion.
- Pure logic belongs in each feature's `domain/` folder (no Flutter, Drift or Riverpod imports) so it can be unit-tested without a device.
- GPS behavior can only be verified on a real phone. Don't claim GPS behavior works from unit tests alone.

## Commit message format

- Prefix: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`.
- Clear, active voice. Describe what changed, not why.
- Examples: `feat: add route table to the database schema`, `test: add haversine distance tests`.

## Pull request message

When the last unit of a ticket is done and its acceptance criteria are met, suggest a PR title and description along with the final commit message. Do not create the PR. The user does that.

- **Title:** the ticket ID and name, for example `1.1 Create the Flutter project`.
- **Description:**
  - What the ticket delivers, in a few lines.
  - The commits or units it was built in.
  - How each acceptance criterion was verified, and anything that was not verified (for example, not run on a device) and why.
  - Decisions made during implementation, especially any that changed the ticket or spec.
  - A link to the ticket file in `project/tickets/`.
- The commit messages say what changed. The "why" belongs in the PR description.

## Code conventions

- Dart files: snake_case names, one main public class per file.
- Tests mirror source paths: `lib/src/x.dart` is tested by `test/src/x_test.dart`. Shared test helpers live in `test/helpers/`.
- Use package imports (`package:na_vrh/src/...`) across folders.
- Layout inside `app/lib/`: `main.dart` plus `src/`. In `src/`: the app layer (`app.dart`, `home_screen.dart`, later `app_router.dart`), `core/`, `data/database/`, and `features/<feature>/{data,domain,presentation}/`. The app layer may import features. Features and `core/` never import it. See ticket 1.2 for the full rules.
- All timestamps are stored and compared in UTC.
- IDs are client-generated UUIDs stored as text.
- Never match peaks by name. Key on the OSM ID.
- Location is read only on a user tap (Start, Detect). No background location.

## Working with tickets

- Tickets live in `project/tickets/`, one file each, named like `1.1_create_flutter_project.md`.
- Tickets are defined one at a time, reviewed by the user, then saved.
- A ticket's "Depends on" line decides the order of work, not its number.
- Acceptance criteria in a ticket are the definition of done for that ticket. Tick them off only when verified.
