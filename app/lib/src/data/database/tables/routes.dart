import 'package:drift/drift.dart';
import 'package:na_vrh/src/data/database/tables/expeditions.dart';
import 'package:na_vrh/src/features/expeditions/domain/route_enums.dart';

/// A route: one target peak within an expedition, carried through its whole
/// life (planned, started, completed) in a single row.
///
/// The row class is `RouteRow`, not Drift's default `Route`, which would clash
/// with Flutter's own `Route` class in any file that imports both.
@DataClassName('RouteRow')
@TableIndex(name: 'routes_expedition_id', columns: {#expeditionId})
class Routes extends Table {
  /// Client-generated UUID, supplied by the caller.
  TextColumn get id => text()();

  /// Deleting the expedition deletes its routes.
  TextColumn get expeditionId =>
      text().references(Expeditions, #id, onDelete: KeyAction.cascade)();

  // Snapshot of the peak at planning time. Copies, not a link to the bundled
  // peaks, so old routes stay readable if peak data changes.

  /// OSM IDs are large integers.
  IntColumn get peakOsmId => integer()();

  TextColumn get peakName => text()();

  RealColumn get peakLat => real()();

  RealColumn get peakLon => real()();

  /// Elevation can be missing in the source data.
  RealColumn get peakElevation => real().nullable()();

  TextColumn get state => textEnum<RouteState>()();

  /// Stored as UTC ISO-8601 text (see `build.yaml`).
  DateTimeColumn get createdAt => dateTime()();

  // GPS fix at Start.

  DateTimeColumn get startedAt => dateTime().nullable()();

  RealColumn get startLat => real().nullable()();

  RealColumn get startLon => real().nullable()();

  RealColumn get startAccuracyM => real().nullable()();

  // Result, set when the route is completed.

  /// GPS timestamp of the summit reading.
  DateTimeColumn get climbedAt => dateTime().nullable()();

  IntColumn get durationS => integer().nullable()();

  TextColumn get source => textEnum<RouteSource>()();

  // Set at detection. Null for a planned or manual route.

  /// The tolerance used at detection.
  RealColumn get toleranceM => real().nullable()();

  RealColumn get estimatedLat => real().nullable()();

  RealColumn get estimatedLon => real().nullable()();

  RealColumn get distanceM => real().nullable()();

  TextColumn get estimationMethod => textEnum<EstimationMethod>().nullable()();

  /// Plain column, not a foreign key: routes and photos point at each other,
  /// and the app keeps this consistent.
  TextColumn get coverPhotoId => text().nullable()();

  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
