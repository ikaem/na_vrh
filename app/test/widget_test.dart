import 'package:flutter_test/flutter_test.dart';

import 'package:na_vrh/main.dart';

void main() {
  testWidgets('home screen shows the app name', (WidgetTester tester) async {
    // given
    const app = NaVrhApp();

    // when
    await tester.pumpWidget(app);

    // then
    expect(find.text('na_vrh'), findsOneWidget);
  });
}
