// Import the Flutter Material library to use widgets and UI components
import 'package:flutter/material.dart';
// Import the OnboardingScreen to navigate to it after the splash screen
import 'package:pretiumfinance/onboarding_screen.dart';
// Import the Dart async library to use the Timer class
import 'dart:async';

// Define the SplashScreen widget as a stateful widget
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState(); // Create the mutable state for this widget
}

// Define the state for the SplashScreen widget
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState(); // Call the parent class's initState method

    // Start a timer that waits for 5 seconds before navigating to the onboarding screen
    Timer(Duration(seconds: 5), () {
      // Replace the current screen with the onboarding screen
      Navigator.pushReplacement(
        context, // The current build context
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ), // Navigate to OnboardingScreen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build the UI for the splash screen
    return Scaffold(
      backgroundColor: Color(
        0xFF1A6A64,
      ), // Set the background color to teal-green
      body: Center(
        // Display the splash screen image in the center of the screen
        child: Image.asset(
          'assets/splash_screen.jpg',
        ), // Load the splash screen image from the assets folder
      ),
    );
  }
}
