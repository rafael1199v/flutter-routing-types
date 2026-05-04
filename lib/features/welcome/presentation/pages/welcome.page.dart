import 'package:flutter/material.dart';
import 'package:flutter_routing_types/features/registration/presentation/pages/registration.page.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = '/welcome';
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController _pageViewController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (currentPage < 2) {
      _pageViewController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageViewController,
            onPageChanged: (index) => {
              setState(() {
                currentPage = index;
              }),
            },
            children: [
              Image.asset("assets/images/welcome1.jpg", fit: BoxFit.cover),
              Image.asset("assets/images/welcome2.jpg", fit: BoxFit.cover),
              Image.asset("assets/images/welcome3.jpg", fit: BoxFit.cover),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 30,
            right: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black
              ),
              onPressed: () {
                if (currentPage == 2) {
                  Navigator.pushNamed(context, RegistrationPage.routeName);
                } else {
                  goToNextPage();
                }
              },
              child: Text(
                currentPage == 2 ? "Comenzar" : "Siguiente",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
