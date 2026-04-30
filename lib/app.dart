import 'package:flutter/material.dart';
import 'features/welcome/presentation/pages/welcome.page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage()
    );
  }
}
