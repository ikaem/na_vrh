import 'package:drift/drift.dart';

/// An expedition: the parent of routes, and through them readings and photos.
@DataClassName('ExpeditionRow')
class Expeditions extends Table {
  /// Client-generated UUID, supplied by the caller.
  TextColumn get id => text()();

  TextColumn get name => text()();

  /// Plain column, not a foreign key: expeditions and photos point at each
  /// other, and the app keeps this consistent (the photos epic clears it when
  /// the cover photo is deleted).
  TextColumn get coverPhotoId => text().nullable()();

  TextColumn get notes => text().nullable()();

  /// Stored as UTC ISO-8601 text (see `build.yaml`).
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
