import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khata_app/pages/my_home_page.dart';
import 'package:khata_app/pages/sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    const animationDuration = Duration(seconds: 2);

    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _bounceAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        // Check if the user is already authenticated
        bool isAuthenticated = await SignInPage.isUserAuthenticated();
        if (isAuthenticated) {
          // User is authenticated, redirect to HomeScreen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        } else {
          // User is not authenticated, show SignInPage
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignInPage()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customize the background color
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: AnimatedBuilder(
            animation: _bounceAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _bounceAnimation.value,
                child: const Icon(
                  FontAwesomeIcons.diagramProject,
                  size: 80.0,
                  color: Colors.deepPurple,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
