import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:na_vrh/src/data/database/app_database.dart';
import 'package:na_vrh/src/features/expeditions/domain/route_enums.dart';

import '../../../../helpers/database_fixtures.dart';
import '../../../../helpers/in_memory_database.dart';

void main() {
  group('Routes table', () {
    test('round-trips a minimal planned route with nulls unset', () async {
      // given
      final db = createInMemoryDatabase();
      addTearDown(db.close);
      await insertExpedition(db);
      final route = RouteRow(
        id: 'route-1',
        expeditionId: 'expedition-1',
        peakOsmId: 1234,
        peakName: 'Vaganski vrh',
        peakLat: 44.3,
        peakLon: 15.5,
        state: RouteState.planned,
        createdAt: DateTime.utc(2026, 1, 2, 3, 4, 5),
        source: RouteSource.gps,
      );

      // when
      await db.into(db.routes).insert(route);
      final read = await db.select(db.routes).getSingle();

      // then
      // Row equality compares every field, so this also proves the unset
      // fields came back null and the enum came back as the same value.
      expect(read, route);
      expect(read.createdAt.isUtc, isTrue);
    });

    test('round-trips a started route with the start fields', () async {
      // given
      final db = createInMemoryDatabase();
      addTearDown(db.close);
      await insertExpedition(db);
      final startedAt = DateTime.utc(2026, 1, 3, 6, 30);
      final route = RouteRow(
        id: 'route-2',
        expeditionId: 'expedition-1',
        peakOsmId: 5678,
        peakName: 'Sveto brdo',
        peakLat: 44.4,
        peakLon: 15.6,
        peakElevation: 1753.0,
        state: RouteState.started,
        createdAt: DateTime.utc(2026, 1, 2),
        startedAt: startedAt,
        startLat: 44.35,
        startLon: 15.55,
        startAccuracyM: 8.5,
        source: RouteSource.gps,
      );

      // when
      await db.into(db.routes).insert(route);
      final read = await db.select(db.routes).getSingle();

      // then
      expect(read, route);
    });

    test('round-trips a completed route with all result fields', () async {
      // given
      final db = createInMemoryDatabase();
      addTearDown(db.close);
      await insertExpedition(db);
      final climbedAt = DateTime.utc(2026, 1, 3, 10, 15, 30);
      final route = RouteRow(
        id: 'route-3',
        expeditionId: 'expedition-1',
        peakOsmId: 9876,
        peakName: 'Sveto brdo',
        peakLat: 44.4,
        peakLon: 15.6,
        peakElevation: 1753.0,
        state: RouteState.completed,
        createdAt: DateTime.utc(2026, 1, 2),
        startedAt: DateTime.utc(2026, 1, 3, 6, 30),
        startLat: 44.35,
        startLon: 15.55,
        startAccuracyM: 8.5,
        climbedAt: climbedAt,
        durationS: 13500,
        source: RouteSource.gps,
        toleranceM: 30.0,
        estimatedLat: 44.4001,
        estimatedLon: 15.6002,
        distanceM: 22.5,
        estimationMethod: EstimationMethod.triangulation,
        coverPhotoId: 'photo-1',
        notes: 'Windy at the top',
      );

      // when
      await db.into(db.routes).insert(route);
      final read = await db.select(db.routes).getSingle();

      // then
      expect(read, route);
      expect(read.climbedAt!.isUtc, isTrue);
    });

    test('round-trips a manual route and the averaging method', () async {
      // given
      final db = createInMemoryDatabase();
      addTearDown(db.close);
      await insertExpedition(db);
      await insertRoute(
        db,
        id: 'route-manual',
        state: RouteState.completed,
        source: RouteSource.manual,
      );
      await insertRoute(db, id: 'route-avg', state: RouteState.completed);
      await (db.update(
        db.routes,
      )..where((r) => r.id.equals('route-avg'))).write(
        const RoutesCompanion(
          estimationMethod: Value(EstimationMethod.averaging),
        ),
      );

      // when
      final manual = await (db.select(
        db.routes,
      )..where((r) => r.id.equals('route-manual'))).getSingle();
      final averaged = await (db.select(
        db.routes,
      )..where((r) => r.id.equals('route-avg'))).getSingle();

      // then
      expect(manual.source, RouteSource.manual);
      expect(manual.estimationMethod, isNull);
      expect(averaged.estimationMethod, EstimationMethod.averaging);
    });

    test('stores an OSM ID larger than 32 bits', () async {
      // given
      final db = createInMemoryDatabase();
      addTearDown(db.close);
      await insertExpedition(db);
      const bigOsmId = 12345678901;

      // when
      await insertRoute(db, peakOsmId: bigOsmId);
      final read = await db.select(db.routes).getSingle();

      // then
      expect(read.peakOsmId, bigOsmId);
    });

    test('deleting an expedition deletes its routes', () async {
      // given
      final db = createInMemoryDatabase();
      addTearDown(db.close);
      await insertExpedition(db, id: 'expedition-1');
      await insertExpedition(db, id: 'expedition-2');
      await insertRoute(db, id: 'route-1', expeditionId: 'expedition-1');
      await insertRoute(db, id: 'route-2', expeditionId: 'expedition-2');

      // when
      await (db.delete(
        db.expeditions,
      )..where((e) => e.id.equals('expedition-1'))).go();
      final remaining = await db.select(db.routes).get();

      // then
      expect(remaining.map((r) => r.id), ['route-2']);
    });

    test('rejects a route for a missing expedition', () async {
      // given
      final db = createInMemoryDatabase();
      addTearDown(db.close);

      // when
      final insert = insertRoute(db, expeditionId: 'no-such-expedition');

      // then
      await expectLater(insert, throwsA(isA<Exception>()));
      expect(await db.select(db.routes).get(), isEmpty);
    });

    test('creates an index on expeditionId', () async {
      // given
      final db = createInMemoryDatabase();
      addTearDown(db.close);

      // when
      final rows = await db
          .customSelect("SELECT name FROM pragma_index_list('routes')")
          .get();

      // then
      expect(
        rows.map((r) => r.read<String>('name')),
        contains('routes_expedition_id'),
      );
    });
  });
}
