import 'package:flutter/material.dart'; // Imports the Flutter Material Design library for UI widgets.
import 'pages/login_page.dart'; // Imports the login_page.dart file, likely containing the LoginPage widget.

// Main onboarding page widget, a StatefulWidget because its state can change.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key})
    : super(
        key: key,
      ); // Constructor for the OnboardingScreen widget, taking an optional Key.

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState(); // Creates and returns the mutable state for this widget.
}

// The state class for the OnboardingScreen widget.
class _OnboardingScreenState extends State<OnboardingScreen> {
  // Page controller to manage the horizontal scrolling of onboarding pages.
  final PageController _pageController = PageController();

  // Current page index, starting at 0.
  int _currentPage = 0;

  // List of OnboardingPageData objects, each representing a single onboarding screen.
  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      icon: Icons.credit_card, // Icon for the first onboarding page.
      title: 'Direct Pay', // Title for the first onboarding page.
      description:
          'Pay with crypto across Africa effortlessly', // Description for the first onboarding page.
      buttonText: 'Next', // Text for the button on the first onboarding page.
      buttonAction: (context, controller) {
        // Function to be executed when the button is pressed on the first page.
        controller.nextPage(
          // Animates to the next page.
          duration: const Duration(
            milliseconds: 300,
          ), // Duration of the animation.
          curve: Curves.easeInOut, // Animation curve for a smooth transition.
        );
      },
    ),
    OnboardingPageData(
      icon:
          Icons.account_balance_wallet, // Icon for the second onboarding page.
      title: 'Accept Payments', // Title for the second onboarding page.
      description:
          'Accept stablecoin payments hassle-free', // Description for the second onboarding page.
      buttonText: 'Next', // Text for the button on the second onboarding page.
      buttonAction: (context, controller) {
        // Function to be executed when the button is pressed on the second page.
        controller.nextPage(
          // Animates to the next page.
          duration: const Duration(
            milliseconds: 300,
          ), // Duration of the animation.
          curve: Curves.easeInOut, // Animation curve for a smooth transition.
        );
      },
    ),
    OnboardingPageData(
      icon: Icons.receipt, // Icon for the third onboarding page.
      title: 'Pay Bills', // Title for the third onboarding page.
      description:
          'Pay for utility services and earn rewards', // Description for the third onboarding page.
      buttonText:
          'Get Started', // Text for the button on the third onboarding page.
      buttonAction: (context, controller) {
        // Function to be executed when the button is pressed on the third page.
        // Navigates to the LoginPage, replacing the current route in the history.
        Navigator.of(
          context, // The current build context.
        ).pushReplacement(
          MaterialPageRoute(builder: (_) => LoginPage()),
        ); // Creates a MaterialPageRoute to the LoginPage.
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Provides the basic visual structure for a Material Design app.
      body: SafeArea(
        // Ensures the content is not obscured by system UI elements like the status bar.
        child: Column(
          // Arranges its children in a vertical line.
          children: [
            // Skip button at the top right corner.
            Align(
              alignment:
                  Alignment
                      .topRight, // Aligns the child to the top right of its parent.
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  right: 16.0,
                ), // Adds padding around the Skip button.
                child: TextButton(
                  // A button that displays plain text.
                  child: const Text(
                    // The text displayed on the button.
                    'Skip',
                    style: TextStyle(
                      // Styles the text.
                      color: Colors.grey, // Sets the text color to grey.
                      fontSize: 16, // Sets the font size to 16.
                      fontWeight:
                          FontWeight.w500, // Sets the font weight to medium.
                    ),
                  ),
                  onPressed: () {
                    // Function to be executed when the Skip button is pressed.
                    // Skips onboarding and navigates directly to the LoginPage, replacing the current route.
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => LoginPage(),
                      ), // Creates a MaterialPageRoute to the LoginPage.
                    );
                  },
                ),
              ),
            ),

            // Expanded PageView for onboarding screens.
            Expanded(
              // Makes the PageView take up the remaining available vertical space.
              child: PageView.builder(
                // A scrollable list that works page by page, optimized for building large lists.
                controller:
                    _pageController, // Assigns the PageController to manage page transitions.
                itemCount:
                    _pages
                        .length, // Sets the total number of pages based on the _pages list.
                onPageChanged: (int page) {
                  // Callback that is called when the page is changed.
                  setState(() {
                    // Triggers a rebuild of the widget to update the UI.
                    _currentPage = page; // Updates the current page index.
                  });
                },
                itemBuilder: (context, index) {
                  // Builder function that creates the widget for each page.
                  return OnboardingPage(
                    // Returns an instance of the OnboardingPage widget.
                    data:
                        _pages[index], // Passes the data for the current page.
                    pageController:
                        _pageController, // Passes the PageController to the OnboardingPage.
                  );
                },
              ),
            ),

            // Page indicator.
            _buildPageIndicator(), // Calls a method to build the visual indicators for the current page.
            // Next button (only one instance now).
            Padding(
              padding: const EdgeInsets.symmetric(
                // Adds symmetric padding horizontally and vertically.
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: ElevatedButton(
                // A styled button with a background color and rounded corners.
                onPressed: () {
                  // Function to be executed when the button is pressed.
                  if (_currentPage < _pages.length - 1) {
                    // Checks if the current page is not the last page.
                    _pageController.nextPage(
                      // Animates to the next page.
                      duration: const Duration(
                        milliseconds: 300,
                      ), // Duration of the animation.
                      curve:
                          Curves
                              .easeInOut, // Animation curve for a smooth transition.
                    );
                  } else {
                    // If it's the last page.
                    Navigator.of(context).pushReplacement(
                      // Navigates to the LoginPage, replacing the current route.
                      MaterialPageRoute(
                        builder: (_) => LoginPage(),
                      ), // Creates a MaterialPageRoute to the LoginPage.
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  // Styles the ElevatedButton.
                  backgroundColor: const Color(
                    0xFF1D6C5E,
                  ), // Sets the background color to a teal shade.
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ), // Sets the minimum width to fill the parent and a fixed height.
                  shape: RoundedRectangleBorder(
                    // Defines the shape of the button.
                    borderRadius: BorderRadius.circular(
                      10,
                    ), // Sets the border radius for rounded corners.
                  ),
                ),
                child: Text(
                  // The text displayed on the button.
                  _currentPage < _pages.length - 1
                      ? 'Next'
                      : 'Get Started', // Changes the text based on the current page.
                  style: const TextStyle(
                    // Styles the text.
                    fontSize: 18, // Sets the font size to 18.
                    color: Colors.white, // Sets the text color to white.
                    fontWeight:
                        FontWeight.bold, // Sets the font weight to bold.
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build the page indicator dots.
  Widget _buildPageIndicator() {
    return Row(
      // Arranges the indicator dots in a horizontal line.
      mainAxisAlignment:
          MainAxisAlignment.center, // Centers the dots horizontally.
      children: List.generate(
        // Creates a list of widgets based on the number of pages.
        _pages
            .length, // The number of indicator dots will be equal to the number of pages.
        (index) => Container(
          // Represents a single indicator dot.
          width: 10, // Sets the width of the dot.
          height: 10, // Sets the height of the dot.
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ), // Adds horizontal margin between the dots.
          decoration: BoxDecoration(
            // Defines the appearance of the dot.
            shape: BoxShape.circle, // Makes the dot circular.
            color:
                _currentPage ==
                        index // Checks if the current dot corresponds to the active page.
                    ? const Color(
                      0xFF1D6C5E,
                    ) // Active indicator color (deep teal).
                    : Colors
                        .grey
                        .shade300, // Inactive indicator color (light grey).
          ),
        ),
      ),
    );
  }
}

// Data model for onboarding page, holds the information for each page.
class OnboardingPageData {
  final IconData icon; // The icon to display on the page.
  final String title; // The title of the page.
  final String description; // The description text for the page.
  final String buttonText; // The text to display on the button of the page.
  final Function(BuildContext, PageController)
  buttonAction; // The function to execute when the button is pressed.

  OnboardingPageData({
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonAction,
  });
}

// Individual onboarding page widget, displays the content for a single onboarding screen.
class OnboardingPage extends StatelessWidget {
  final OnboardingPageData
  data; // Holds the data for the current onboarding page.
  final PageController
  pageController; // The PageController to manage page navigation.

  const OnboardingPage({
    Key? key,
    required this.data,
    required this.pageController,
  }) : super(key: key); // Constructor for the OnboardingPage widget.

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Adds padding around the content of the page.
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // Arranges its children in a vertical line.
        mainAxisAlignment:
            MainAxisAlignment.center, // Centers the children vertically.
        children: [
          // Circular icon container.
          Container(
            width: 120, // Sets the width of the container.
            height: 120, // Sets the height of the container.
            decoration: BoxDecoration(
              // Defines the appearance of the container.
              color:
                  Colors
                      .teal
                      .shade50, // Sets the background color to a light teal shade.
              shape: BoxShape.circle, // Makes the container circular.
            ),
            child: Center(
              // Centers its child within itself.
              child: Icon(
                data.icon,
                size: 60,
                color: Colors.teal.shade700,
              ), // Displays the icon with a specific size and color.
            ),
          ),
          const SizedBox(height: 24), // Adds vertical spacing.
          // Title.
          Text(
            data.title, // Displays the title of the page.
            style: const TextStyle(
              // Styles the text.
              fontSize: 24, // Sets the font size to 24.
              fontWeight: FontWeight.bold, // Sets the font weight to bold.
              color: Colors.teal, // Sets the text color to teal.
            ),
          ),
          const SizedBox(height: 16), // Adds vertical spacing.
          // Description.
          Text(
            data.description, // Displays the description of the page.
            textAlign: TextAlign.center, // Centers the text horizontally.
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ), // Styles the text.
          ),
          const SizedBox(height: 32), // Adds vertical spacing.
        ],
      ),
    );
  }
}
