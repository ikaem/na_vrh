import 'package:na_vrh/src/data/database/app_database.dart';
import 'package:na_vrh/src/features/expeditions/domain/route_enums.dart';

/// Inserts a minimal expedition and returns the inserted row.
///
/// Every field has a default, so tests override only what they care about.
Future<ExpeditionRow> insertExpedition(
  AppDatabase db, {
  String id = 'expedition-1',
  String name = 'Test expedition',
  String? coverPhotoId,
  String? notes,
  DateTime? createdAt,
}) async {
  final row = ExpeditionRow(
    id: id,
    name: name,
    coverPhotoId: coverPhotoId,
    notes: notes,
    createdAt: createdAt ?? DateTime.utc(2026, 1, 1),
  );
  await db.into(db.expeditions).insert(row);
  return row;
}

/// Inserts a minimal `planned` route and returns the inserted row.
///
/// The parent expedition must already exist (see [insertExpedition]), because
/// [expeditionId] is a foreign key. It defaults to the id [insertExpedition]
/// uses by default.
Future<RouteRow> insertRoute(
  AppDatabase db, {
  String id = 'route-1',
  String expeditionId = 'expedition-1',
  int peakOsmId = 1,
  String peakName = 'Test peak',
  double peakLat = 45.0,
  double peakLon = 15.0,
  RouteState state = RouteState.planned,
  RouteSource source = RouteSource.gps,
  DateTime? createdAt,
}) async {
  final row = RouteRow(
    id: id,
    expeditionId: expeditionId,
    peakOsmId: peakOsmId,
    peakName: peakName,
    peakLat: peakLat,
    peakLon: peakLon,
    state: state,
    createdAt: createdAt ?? DateTime.utc(2026, 1, 1),
    source: source,
  );
  await db.into(db.routes).insert(row);
  return row;
}
