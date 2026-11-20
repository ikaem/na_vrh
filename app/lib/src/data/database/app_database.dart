import 'package:drift/drift.dart';

part 'app_database.g.dart';

/// The app's local SQLite database.
///
/// The executor is injected so tests can pass an in-memory database and the
/// app can pass the on-device one.
@DriftDatabase(tables: [])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
