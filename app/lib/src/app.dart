import 'package:material_ui/material_ui.dart';
import 'package:na_vrh/src/home_screen.dart';

class NaVrhApp extends StatelessWidget {
  const NaVrhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'na_vrh', home: HomeScreen());
  }
}
