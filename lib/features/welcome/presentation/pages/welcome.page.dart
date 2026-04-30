import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController _pageViewController;
  int _paginaActual = 0;

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
    if (_paginaActual < 2) {
      _pageViewController.animateToPage(
        _paginaActual + 1,
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
                _paginaActual = index;
              }),
            },
            children: [
              // Image.assets("assets/images/photo1.jpeg", fit: BoxFit.cover),
              // Image.assets("assets/images/photo2.jpeg", fit: BoxFit.cover),
              // Image.assets("assets/images/photo3.jpeg", fit: BoxFit.cover)
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
              ),
              onPressed: () {
                if (_paginaActual == 2) {
                } else {
                  goToNextPage();
                }
              },
              child: Text(
                _paginaActual == 2 ? "Comenzar" : "Siguiente",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
