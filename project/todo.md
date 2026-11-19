# na_vrh - Todo

Items that are not scheduled into an epic yet. Moved here from [SPEC.md](./SPEC.md) section 13.

## Top priority

- [ ] **Decide designs.**
  - [ ] Decide the screens of the app (which screens exist and how they connect).
  - [ ] Design those screens as HTML mockups in `project/design/`, iterating until happy. Same approach as the budget_always design showcase: one folder per screen type, numbered iterations, and an `index.html` showcase that previews them at phone width.

## Later

- [ ] Statistics on the history screen (totals, unique peaks, highest peak).
- [ ] Pause button for timed routes, to separate moving time from total time.
- [ ] Notifications, e.g. a reminder for a route started many hours ago.
- [ ] Showing the start location (stored in v1, display is not designed yet).
- [ ] Photo captions.
- [ ] Handling EXIF location data in exported or shared photos (strip or warn), once sharing exists.
- [ ] Destinations that are not peaks (free-form points).
- [ ] Automatic cloud backup (needs accounts or a server).
- [ ] Multi-device sync (client UUIDs already allow idempotent sync).
- [ ] Figure out how to support other countries: peaks, maps, and per-country config. Not designed yet. Maybe the user picks countries from a dropdown or list, and the app downloads what that country needs. Things to figure out:
  - What a "country pack" contains: the peaks file for the country, map data (maps are a v1 non-goal, see SPEC.md), and any per-country config (for example which name tag to show, such as `name:hr`).
  - Where packs are hosted and how the app downloads them. SPEC.md suggests static files, for example on Cloudflare R2, and notes this only pays off once maps or more countries exist.
  - Generalizing the peak data pipeline (epic 2) to run per country, and the monthly refresh job (epic 11) to cover each country.
  - The user experience: choosing countries up front, downloading before a trip, and removing a country to free storage.
  - What happens to logged climbs when a country pack is removed. The route snapshot of the peak (SPEC.md section 4) should keep old climbs readable, but this needs checking.
  - Peak identity across countries: OSM IDs are global, so they should stay unique, but peaks near borders may fall under two countries.
  - Search and the peak picker with several countries loaded (SPEC.md section 5).
- [ ] Rankings (manual entries excluded).
- [ ] Peak picker filters by region or minimum elevation.
- [ ] Smartwatch companion app (Wear OS first). Notes from the discussion (verify current Flutter and Wear OS status before deciding):
  - Flutter runs on Wear OS (it is Android), but has no official support or Wear-specific widgets. Alternative: a native Kotlin app with Compose for Wear OS. Apple Watch would need native Swift (not relevant while Android-only).
  - Connection: start with the Wear OS Data Layer link to the paired phone (works offline). A server is only needed for watch-without-phone (LTE) or other devices on the same data.
  - Realistic watch features: Start a route, Detect, see today's planned routes. Not photos, search, or history.
  - The watch has the same offline problem as the phone: it needs its own local copy of the peaks and routes, and syncs when it can.
  - GPS only on a tap (as in the phone app) keeps battery use low.
  - Sync will need `updated_at` and a deleted flag (instead of removing rows) on the synced tables. Can be added later through the migration system. UUID IDs are already in place.
  - If the watch app is Flutter, the pure Dart logic (haversine, averaging, route state, duration) can be shared. If native Kotlin, it has to be rewritten or stay on the phone.
  - No schema or ticket changes needed now.
- [ ] Install a separate JDK (17 or newer) and use it for Android builds, instead of relying on the JDK bundled with Android Studio.
  - Why: on this machine Flutter found its JDK only through Android Studio's snap install. Flutter locates Android Studio through `~/.cache/Google/AndroidStudio*/.home`, and each file points to a specific snap revision. After a snap update deletes the old revision, those files point to a missing folder, Flutter finds no JDK, and builds fail with "JAVA_HOME is not set" until Android Studio is started once (this happened on 2026-11-16).
  - What: install a JDK (for example an OpenJDK package), then tell Flutter to use it with `fvm flutter config --jdk-dir <path>` or set `JAVA_HOME`.
  - Then: update the JDK requirement in `app/README.md` to say which JDK to use and how Flutter is pointed at it.
