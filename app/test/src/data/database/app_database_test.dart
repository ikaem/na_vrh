import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/in_memory_database.dart';

void main() {
  group('AppDatabase', () {
    test('enables foreign key enforcement when opened', () async {
      // given
      final db = createInMemoryDatabase();
      addTearDown(db.close);

      // when
      final rows = await db.customSelect('PRAGMA foreign_keys').get();

      // then
      expect(rows.single.read<int>('foreign_keys'), 1);
    });
  });
}
