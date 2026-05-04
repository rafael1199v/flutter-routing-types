import 'package:flutter/material.dart';
import 'features/welcome/presentation/pages/welcome.page.dart';
import 'features/registration/presentation/pages/registration.page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomePage.routeName,
      routes: {
        WelcomePage.routeName: (context) => const WelcomePage(),
        RegistrationPage.routeName: (context) => const RegistrationPage(),
      },
    );
  }
}
