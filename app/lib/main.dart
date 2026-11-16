import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const NaVrhApp());
}

class NaVrhApp extends StatelessWidget {
  const NaVrhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'na_vrh', home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('na_vrh')));
  }
}
