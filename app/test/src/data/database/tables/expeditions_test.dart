import 'package:flutter_test/flutter_test.dart';
import 'package:na_vrh/src/data/database/app_database.dart';

import '../../../../helpers/in_memory_database.dart';

void main() {
  group('Expeditions table', () {
    test('round-trips an expedition with every field intact', () async {
      // given
      final db = createInMemoryDatabase();
      addTearDown(db.close);
      final createdAt = DateTime.utc(2026, 1, 2, 3, 4, 5, 678, 9);
      final expedition = ExpeditionRow(
        id: 'expedition-1',
        name: 'Dinaric traverse',
        coverPhotoId: 'photo-1',
        notes: 'Bring crampons',
        createdAt: createdAt,
      );

      // when
      await db.into(db.expeditions).insert(expedition);
      final read = await db.select(db.expeditions).getSingle();

      // then
      expect(read, expedition);
      expect(read.createdAt.isUtc, isTrue);
      expect(read.createdAt, createdAt);
      expect(
        read.createdAt.microsecondsSinceEpoch,
        createdAt.microsecondsSinceEpoch,
      );
    });

    test('stores optional fields as null', () async {
      // given
      final db = createInMemoryDatabase();
      addTearDown(db.close);
      final expedition = ExpeditionRow(
        id: 'expedition-2',
        name: 'Day hike',
        createdAt: DateTime.utc(2026, 1, 2),
      );

      // when
      await db.into(db.expeditions).insert(expedition);
      final read = await db.select(db.expeditions).getSingle();

      // then
      expect(read.coverPhotoId, isNull);
      expect(read.notes, isNull);
    });
  });
}
