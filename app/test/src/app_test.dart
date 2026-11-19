import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:na_vrh/src/app.dart';
import 'package:na_vrh/src/home_screen.dart';

void main() {
  testWidgets('app shows the home screen', (WidgetTester tester) async {
    // given
    const app = NaVrhApp();

    // when
    await tester.pumpWidget(app);

    // then
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('app sets the title', (WidgetTester tester) async {
    // given
    const app = NaVrhApp();

    // when
    await tester.pumpWidget(app);

    // then
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.title, 'na_vrh');
  });
}
