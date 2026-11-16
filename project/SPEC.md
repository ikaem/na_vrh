# na_vrh - Spec (draft v0.3)

A simple mobile app: the user plans a mountain trip, optionally presses Start at the trailhead, and on the summit taps a button. The app reads GPS and tells them whether they reached that peak. Photos can be attached along the way, and a history screen shows everything they have climbed.

Personal tool first. Rankings or social features are out of scope, but the data model should not block them later.

---

## 1. Goals and non-goals

**Goals**
- Work fully offline (summits often have no signal).
- Answer one question: "Am I at the summit of the peak I planned?"
- Keep a personal log of climbs, with duration and photos, and enough raw data to re-evaluate them later.

**Non-goals (v1)**
- Background or continuous location tracking.
- Accounts, multi-device sync, rankings, leaderboards.
- Map tiles or route tracking.
- Anti-cheat (mock location detection is optional and low priority).
- Peaks outside Croatia.
- iOS (Android only for now, see section 14).
- Destinations that are not peaks (free-form points).
- A custom in-app camera screen (the OS camera and photo picker are used).

---

## 2. Terminology

- **Expedition:** a trip. It holds photos and one or more routes.
- **Route:** one target to reach. In v1 a route targets a single peak. It has its own Start, Detect, tolerance, duration and photos.

Planning a peak automatically creates an expedition containing that one route. A ridge traverse is one expedition with several routes.

---

## 3. Core flow

1. **Plan:** user searches the peak list and plans a peak. This creates an expedition (named after the peak by default, editable) with one route. Can be done at home.
2. **Add more peaks (optional):** user adds another peak to the same expedition (e.g. a ridge with several tops).
3. **Photos (any time):** photos can be added to the expedition or to one of its routes from the moment it is planned, even before any top is reached (see section 9).
4. **Start (optional):** at the trailhead, user presses Start on a route. The app records the start time and a GPS fix (see 6A).
5. **Detect:** on the summit, user taps "Detect" next to a route.
6. **Collect:** app waits for a good GPS fix, then collects readings (see 6).
7. **Resolve:** app computes a position and compares it with that route's peak, using the tolerance.
8. **Result:**
   - Within tolerance: route is marked completed, logged with the date (and duration, if it was started).
   - Outside tolerance: "You are N m away from <peak>", route is not completed. A started route keeps running.
9. Repeat climbs of the same peak are new expeditions on different dates.

Because detection targets a single planned peak, most peak-matching ambiguity (nearby tops, duplicate names, ridge summits) does not arise.

Several routes can be started at the same time, including in v1.

**Expedition UI rule:** the expedition layer is shown only when it has 2 or more routes, or has its own photos or notes. A single-route expedition with nothing extra looks like a plain climb.

**Derived values:** an expedition's dates and status (planned, in progress, completed, partly completed) are computed from its routes, not stored separately.

---

## 4. Peak data

- **Source:** OpenStreetMap, `natural=peak` nodes for Croatia.
- **Delivery:** bundled in the app as a local file (expected well under 1 MB).
- **Later (not v1):** optional on-demand region download, hosted as static files (e.g. Cloudflare R2). Only worthwhile if map tiles or more countries are added.

**Fields per peak**
- OSM ID (primary key, never match on name)
- `name`, `name:hr`, `alt_name` (all three kept for now; display rule TBD)
- latitude, longitude
- elevation in meters (`ele` tag), nullable

**Rules**
- Elevation may be missing: UI and logic must handle null, and elevation is never used in matching.
- Peaks sharing a name are distinguished in the UI by elevation and distance.
- A route stores a snapshot of its target (name, lat, lon, elevation), so the target can later be something other than an OSM peak without a migration.

---

## 5. Peak picker

- Searchable list of all bundled peaks.
- Search ignores diacritics (typing "cakovec" matches "Čakovec"; handles č ć š ž đ).
- Default sort: distance from the user if a location is available, otherwise alphabetical.
- Each row shows name and elevation.
- Selecting a peak plans it (new expedition) or adds it to an existing expedition.
- Later: filters by region or minimum elevation.

---

## 6. Detection

**6.1 Preconditions**
- Wait for a usable fix before collecting (initial target: accuracy under about 20 m). Show "Finding your location..." meanwhile.
- If location permission is denied or only approximate location is granted, explain that precise location is required.

**6.2 Reading collection**
- Collect multiple readings over a short window (e.g. 5 to 10 readings, roughly 10 seconds; "hold still").
- Store every raw reading: `lat, lon, accuracy, GPS timestamp`.

**6.3 Position estimation (undecided, both to be tested)**
- **Method A, averaging:** average readings taken in one spot, optionally weighted by accuracy.
- **Method B, triangulation-style:** readings taken at several positions around the top, combined into one estimate.
- Raw readings are always stored, so both methods can be run on the same check-ins and compared, including on old data. The final choice is deferred until tested.

**6.4 Matching**
- Compute distance from the estimated position to the route's peak using the haversine formula (never raw lat/lon subtraction).
- Reached if distance <= tolerance.

**6.5 Tolerance**
- User-configurable, with a sensible default (e.g. 50 m).
- The tolerance used is stored with each route, so the log shows what standard each climb was held to.

**6.6 Time**
- The route's date (`climbed_at`) comes from the GPS fix timestamp, not the device clock.
- Duration (see 6A) uses device clock timestamps for both start and finish, so it stays consistent even if the clock is wrong.
- All timestamps are stored as absolute UTC, so daylight saving or timezone changes cannot distort durations.

---

## 6A. Timed routes (Start button)

- A route has a state: `planned` -> `started` -> `completed`.
- Pressing **Start** records `started_at` (UTC) and captures a GPS fix (`start_lat`, `start_lon`, `start_accuracy`). The start location is stored for later; how it is displayed is a later problem.
- `started_at` is written to the database immediately, never held only in memory, so an app kill or phone restart does not lose it.
- Several routes can be in the `started` state at once.
- **Duration** = time of successful detection minus `started_at`. It is total elapsed time, ascent only. It includes breaks, and the UI should say so. Descent is not tracked. There is no separate expedition timer in v1.
- A failed Detect (outside tolerance) does not stop the timer.
- A started route that never reaches the summit stays in the list, marked "awaiting summit". No automatic abandon rule. The user can remove it like any planned route.
- Pressed Start too early or too late: `started_at` can be edited afterwards.
- Forgot to press Start: the route is still valid, with no duration. It can be set by editing afterwards.
- Durations can exceed 24 hours (hut overnight), so display days and hours when needed.

---

## 7. History screen

A list of logged routes (completed ascents).

**Fields shown:** date, peak name, elevation (or "n/a" if missing), duration (empty if not timed or manual), tolerance used, source (`gps` or `manual`), and the route's cover photo thumbnail if there is one.

**Views:** a flat chronological list of every ascent, a per-peak view ("climbed 3 times"), and an optional grouping by expedition. Repeat ascents appear as separate records in the flat list.

**Sorting and filtering:** by date, elevation, and name, plus basic filters.

**Actions:** edit (date, start time, notes) and delete a route, reachable from this list.

**Manual entries:** shown clearly marked, with no duration and no GPS data (those fields empty).

**Empty state:** a first-time user sees a friendly message pointing to "plan a climb".

Routes awaiting summit (started, not yet detected) appear in a planned list, marked as such.

---

## 8. Expedition management

- Rename an expedition.
- Add another peak (route) to an expedition.
- Move a route between expeditions.
- **Deleting a route:** its photos move up to the expedition level, they are not deleted.
- **Deleting an expedition:** removes all its routes and photos, after a confirmation.

---

## 9. Photos

- Photos attach to an **expedition** (general) or to a specific **route** of it. The user picks the route when attaching.
- Photos can be added from the moment the expedition is planned, before any top is reached, and later to any past expedition (for example from the gallery after getting home).
- Manual entries can have photos too.
- **Source:** the OS camera or the system photo picker. No custom camera screen.
- **Storage:** photos are copied into app storage, resized and compressed (e.g. max 2000 px, JPEG), not just referenced from the gallery. A photo deleted from the gallery therefore does not break the log.
- **Cleanup:** deleting a photo, route or expedition removes the copied files so storage is not leaked.
- **Cover photo:** one photo can be chosen as the cover, at both expedition level and route level. The cover shows as the thumbnail in lists.
- **Permissions:** the system photo picker needs no broad gallery permission. Camera permission is requested only when the user takes a photo in the app.
- **EXIF (timestamp, location):** optional. It can be used to suggest which route a photo belongs to, but is never relied on, since it is often missing or stripped.
- **Export:** the export feature must include photos, or at least warn that they are not included. Uninstalling the app loses them otherwise.
- **Storage growth:** resizing and compression keep it manageable. A storage usage warning can come later.

---

## 10. Data model (local database)

Version the schema from day one, with migrations.

**expedition**
- id (UUID)
- name
- cover_photo_id (nullable)
- notes (optional)
- created_at

**route** (replaces the earlier separate planned and logged climb tables; one record through its whole lifecycle)
- id (client-generated UUID, for future idempotent sync)
- expedition_id
- peak_osm_id
- peak snapshot: name, lat, lon, elevation
- state: `planned` | `started` | `completed`
- created_at
- started_at (nullable), start_lat, start_lon, start_accuracy_m (nullable)
- climbed_at (nullable until completed; GPS timestamp, used for the date)
- duration_s (nullable)
- source: `gps` | `manual`
- tolerance_m (the tolerance used)
- estimated_lat, estimated_lon, distance_m, estimation_method (nullable until detected)
- cover_photo_id (nullable)
- notes (optional)

**reading** (raw GPS samples)
- id, route_id
- attempt_id (groups the readings from one Detect tap)
- lat, lon, accuracy_m, gps_timestamp

Failed detections (outside tolerance) may be kept as attempts with their readings, so tolerance and methods can be re-evaluated later. Retention is TBD.

**photo**
- id
- expedition_id
- route_id (nullable; null means an expedition-level photo)
- file_path (app storage)
- taken_at (nullable)
- caption (nullable, unused in v1)

---

## 11. Manual entries

- A user can add a climb manually (forgot to tap, or no GPS).
- Pick a peak from the list and enter a date. This creates a manual expedition with a manual route.
- Stored with `source = manual`, with no duration or GPS data, and clearly marked in the history.
- Manual entries can have photos.
- Manual entries must never count toward any future rankings.

---

## 12. Other decisions

- **Repeat ascents:** a new plan creates a new expedition, on a different date.
- **Multiple peaks in one day:** handled by an expedition with several routes, or by separate expeditions.
- **Elevation from GPS:** not used (too inaccurate).
- **Mock locations:** optional flag recorded on Android (`isMock`), low priority.
- **Background location:** not used. Location is read only on a button tap (detect, start).
- **Backup/export:** local-only data is lost on uninstall, so offer export and import. Not yet discussed in depth; current leaning (not a decision):
  - A manual "Export" button that produces one zip (data as JSON, plus photos) and opens the system share sheet, so the user can save it to Drive, email it, or move it to a computer.
  - A matching "Import" that restores from that zip. An export that cannot be restored is not a backup, and restoring onto a new phone is the main use case.
  - No automatic cloud backup in v1 (it would need accounts or a server, which are out of scope).
  - Android's own app backup and iOS's iCloud device backup may already preserve the local database, but behavior varies by platform and setup, so they are not relied on alone.

---

## 13. Todo / later

Moved to [todo.md](./todo.md).

---

## 14. Tech stack

**Platform:** Flutter (Dart), Android only for now. Flutter keeps iOS possible later, mainly by adding iOS permission strings.

| Concern | Choice | Notes |
|---|---|---|
| Local database | Drift (SQLite) | Typed queries and migrations; schema versioned from day one |
| State management | Riverpod | |
| GPS | geolocator | Per-reading accuracy and timestamp, `isMocked` flag |
| Photos | image_picker, flutter_image_compress, path_provider | System camera and picker, resize to about 2000 px, copy into app storage |
| Export / import | archive (zip), share_plus, file_picker | See section 12 for the leaning |
| Peak search | In-memory filter with diacritic normalization | About 1 MB of data, so no search index is needed |

**Peak data pipeline:** a separate one-off script, written in Dart (not part of the app, run manually on a computer), that:
1. Queries OpenStreetMap via the Overpass API for Croatian `natural=peak`.
2. Keeps only the fields from section 4 (name, `name:hr`, `alt_name`, lat, lon, elevation, OSM ID).
3. Writes a JSON or SQLite asset that is bundled in the app.

Re-run it to refresh the data. The pipeline is not built yet; it will be written later. Because the app depends on its output, it is the first thing to build. After running it, spot-check a few known peaks (e.g. Sljeme, Vaganski vrh, Dinara) for sensible coordinates and heights.

**Data refresh automation (planned, not built yet)**

OpenStreetMap peak data for Croatia changes slowly (new minor tops, corrected names or heights, small position fixes), so a refresh once a month is enough. A scheduled CI job automates it:

1. A scheduled workflow (cron, monthly) runs the Dart pipeline script.
2. It writes the new peaks file into the repo.
3. If the file is unchanged, nothing happens. If it differs, the job opens a PR (e.g. with the `peter-evans/create-pull-request` action).
4. A human reviews and merges the PR. There is no auto-merge.

Assumption: the repo is hosted on GitHub, so the job is a GitHub Actions workflow. If the host is different, the idea stays the same and only the CI syntax changes.

Rules for the pipeline and the job:
- **Deterministic output:** peaks are sorted by OSM ID, with stable key order and fixed number formatting, and no "generated at" timestamp inside the file. Otherwise every run looks like a change.
- **Retries:** the script retries Overpass requests a few times on timeouts or rate limits. If it still fails, the job fails loudly and never writes partial data.
- **Sanity check:** if the new result has noticeably fewer peaks than the current file (e.g. a drop of more than a few percent), or is empty, the job fails and opens no PR, so a bad response can never wipe the data.
- **Readable PRs:** the PR description summarizes the change: peaks added, removed, and changed, listed by name. Reviewers should not have to read a raw JSON diff.
- **Upstream mistakes:** OSM vandalism or errors could appear in a PR. Manual review is the safeguard, and the reason for no auto-merge. Real errors are best fixed upstream in OSM, which the next run picks up.
- **Data version:** the file carries a data version, derived from its content or from the merge date, not generated on each run. It can be shown in the app and helps debugging.
- **Releasing:** a merged data PR is a prompt to consider an app release, not an automatic trigger. Most diffs (e.g. one corrected spelling) are not worth a release on their own. The decision stays manual for now. A threshold rule (e.g. release when there are 10 or more changes) can be added later.

**Android notes**
- Fine location permission is requested only when the user taps Start or Detect. No background location.
- The system photo picker needs no storage permission on modern Android.
- Haversine distance and the averaging method are plain Dart, with no package.

**Testing**
- Pure logic is unit-tested without a device: haversine, position averaging, route state transitions, duration calculation, diacritic search.
- GPS behavior needs a real phone. The averaging vs triangulation comparison needs real hikes.

---

## 15. Open questions

1. Averaging vs triangulation: test both on real hikes, then decide.
2. Which peak name to display (`name`, `name:hr`, `alt_name`)?
3. Default tolerance value, and the accuracy threshold to start collecting.
4. Retention of failed attempts and their raw readings.
5. Export and import (see section 12 for the current leaning):
   - Is the export a manually saved file, or an automatic backup to the cloud?
   - Format: a zip of JSON plus photos, or something more standard (e.g. GPX for locations)?
   - Import: is restore from the same zip required in v1?
   - Cadence: manual only, or a periodic reminder to export?
   - Photos: included by default, given they may be most of the file size?
