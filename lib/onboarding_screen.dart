import 'package:flutter/material.dart';
import 'pages/login_page.dart';

// Main onboarding page widget
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Page controller to manage onboarding page navigation
  final PageController _pageController = PageController();

  // Current page index
  int _currentPage = 0;

  // List of onboarding page data
  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      icon: Icons.credit_card,
      title: 'Direct Pay',
      description: 'Pay with crypto across Africa effortlessly',
      buttonText: 'Next',
      buttonAction: (context, controller) {
        controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    ),
    OnboardingPageData(
      icon: Icons.account_balance_wallet,
      title: 'Accept Payments',
      description: 'Accept stablecoin payments hassle-free',
      buttonText: 'Next',
      buttonAction: (context, controller) {
        controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    ),
    OnboardingPageData(
      icon: Icons.receipt,
      title: 'Pay Bills',
      description: 'Pay for utility services and earn rewards',
      buttonText: 'Get Started',
      buttonAction: (context, controller) {
        // TODO: Implement navigation to main app or login screen
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip button at the top right corner
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 16.0),
                child: TextButton(
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    // Skip onboarding and go directly to main app
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginPage()),
                    );
                  },
                ),
              ),
            ),

            // Expanded PageView for onboarding screens
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    data: _pages[index],
                    pageController: _pageController,
                  );
                },
              ),
            ),

            // Page indicator
            _buildPageIndicator(),

            // Next button (only one instance now)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < _pages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginPage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D6C5E), // Teal color
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  _currentPage < _pages.length - 1 ? 'Next' : 'Get Started',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (index) => Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                _currentPage == index
                    ? const Color(
                      0xFF1D6C5E,
                    ) // Active indicator color (deep teal)
                    : Colors.grey.shade300, // Inactive indicator color
          ),
        ),
      ),
    );
  }
}

// Data model for onboarding page
class OnboardingPageData {
  final IconData icon;
  final String title;
  final String description;
  final String buttonText;
  final Function(BuildContext, PageController) buttonAction;

  OnboardingPageData({
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonAction,
  });
}

// Individual onboarding page widget
class OnboardingPage extends StatelessWidget {
  final OnboardingPageData data;
  final PageController pageController;

  const OnboardingPage({
    Key? key,
    required this.data,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular icon container
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(data.icon, size: 60, color: Colors.teal.shade700),
            ),
          ),
          const SizedBox(height: 24),

          // Title
          Text(
            data.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 16),

          // Description
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
