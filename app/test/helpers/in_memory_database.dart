import 'package:drift/native.dart';
import 'package:na_vrh/src/data/database/app_database.dart';

/// Creates a fresh in-memory [AppDatabase] for tests.
///
/// The caller owns the database and should close it (for example with
/// `addTearDown(db.close)`).
AppDatabase createInMemoryDatabase() => AppDatabase(NativeDatabase.memory());
