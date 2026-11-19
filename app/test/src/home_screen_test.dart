import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:na_vrh/src/home_screen.dart';

void main() {
  testWidgets('home screen shows the app name', (WidgetTester tester) async {
    // given
    const screen = MaterialApp(home: HomeScreen());

    // when
    await tester.pumpWidget(screen);

    // then
    expect(find.text('na_vrh'), findsOneWidget);
  });
}
