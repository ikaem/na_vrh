/// Where a route is in its life. Stored by name in the database, so never
/// rename or remove a value once the app has real data.
enum RouteState { planned, started, completed }

/// How a route's result was recorded. Stored by name.
enum RouteSource { gps, manual }

/// How the estimated summit position was computed at detection. Stored by
/// name.
enum EstimationMethod { averaging, triangulation }
