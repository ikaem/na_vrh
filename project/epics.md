# na_vrh - Epics

Derived from [SPEC.md](./SPEC.md). Section numbers refer to that file. Tickets for each epic are not written yet.

## Epics

1. **Project foundations** (sec 10, 14)
   Flutter project, folder structure, navigation setup, Riverpod and Drift setup, linting, a basic CI job that runs tests, and schema v1 with the migration setup.

2. **Peak data pipeline** (sec 4, 14)
   The Dart script that queries Overpass and writes the deterministic peaks file, plus the spot check of known peaks.

3. **Peak data in app and picker** (sec 4, 5)
   Load the bundled asset, a peak repository, diacritic-insensitive search, sorting by distance, and the picker UI.
   Depends on: 1, 2.

4. **Expeditions and routes** (sec 2, 3, 8, 11)
   Planning a peak (creates an expedition and a route), adding a peak to an expedition, rename, move a route, delete rules, the "hide trivial expedition" UI rule, derived status, and manual entries.
   Depends on: 1, 3.

5. **Settings** (sec 6.1, 6.5)
   A settings screen and storage for the tolerance and the accuracy threshold, with sensible defaults.
   Depends on: 1.

6. **Location and detection** (sec 6)
   Permissions, the GPS service, waiting for a good fix, reading collection, haversine, averaging, matching against the tolerance, storing readings and attempts, and the result screen. Triangulation is built as a second, swappable method.
   Depends on: 1, 4, 5.

7. **Timed routes** (sec 6A)
   Start with a GPS fix, saving `started_at` immediately, duration on completion, the "awaiting summit" state, and editing the start time.
   Depends on: 6.

8. **History screen** (sec 7)
   The flat list, the per-peak view, expedition grouping, sort and filter, edit and delete, and the empty state.
   Depends on: 4, and on 6 for real data.

9. **Photos** (sec 9)
   Camera and picker, resize and copy into app storage, attach to an expedition or a route, cover photos, a gallery UI, and file cleanup on delete.
   Depends on: 4.

10. **Export and import** (sec 12)
    The zip with JSON and photos, share sheet, and restore.
    Depends on: 4, 9. Blocked on the open export questions in SPEC.md section 15.

11. **Data refresh automation** (sec 14)
    The monthly CI job, deterministic output checks, the sanity check, and the PR summary.
    Depends on: 2.

12. **Field testing and tuning** (sec 6, 15)
    Recording real hikes to compare averaging vs triangulation, and settling the default tolerance and accuracy threshold.
    Depends on: 5, 6.

13. **Play Store release** (sec 14)
    App name, icon and listing, release signing, a privacy policy and data safety form (the app uses location and photos), and distribution through an internal test track.
    Depends on: a usable app.
    Note (to verify): Google Play may require newly created personal developer accounts to run a closed test with a minimum number of testers for a minimum period before production access. If it applies, start the closed test early, since it is a calendar wait, not work.

14. **Release automation**
    Scope not defined yet. Placeholder epic, to be defined once the manual release process (epic 13) is understood.
    Depends on: 13.

## Suggested order

First usable version: 1, 2, 3, 4, 5, 6, then a minimal 8. That reaches "plan a peak, detect it, see it in a list".

Then 7, 9, 10, 11, 12 and 13 in any order, with 14 last.
