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
- [ ] Region downloads and other countries.
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
