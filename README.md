# Pretium Finance

A modern mobile banking application built with Flutter that provides a clean and intuitive interface for financial management.

## Features

- **Secure Authentication**: PIN-based login system with visibility toggle
- **Account Dashboard**: View account balances with hide/show functionality
- **Financial Services**: Send money, buy goods, pay bills, and purchase airtime
- **QR Code Payments**: Quick access to scan and pay functionality
- **Transaction History**: View all past transactions in an organized manner

## Screenshots

- Splash Screen
- Onboarding Pages
- Login/Authentication
- Home Dashboard
- Transaction History

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) 3.7.0 or higher
- [Dart](https://dart.dev/get-dart) 3.0.0 or higher
- Android Studio / VS Code
- Android SDK / iOS Development Tools

### Installation

1. Clone this repository:

git clone https://github.com/yourusername/pretiumfinance.git

2. Navigate to the project directory:

cd pretiumfinance

3. Install dependencies:
        flutter pub get

4. Create assets folder and add required assets:
mkdir -p assets
# Add your splash_screen.jpg and other assets to this folder

5. Run the application:
flutter run

## Project Structure

lib/
├── main.dart                  # Entry point
├── pages/
│   ├── splash_screen.dart     # Initial loading screen
│   ├── onboarding_screen.dart # First-time user tutorials
│   ├── login_page.dart        # Authentication screen
│   ├── pin_verification_page.dart # Security PIN setup
│   ├── landing_page.dart      # Home screen/dashboard
│   ├── transactions_page.dart # Transaction history
│   └── forgot_password_page.dart # Password recovery
├── widgets/
│   └── floating_text_field.dart # Custom text input component
└── utils/
    └── constants.dart         # App-wide constants

Building for Production
To build the release version of the app:

# For Android
flutter build apk --release

# For iOS
flutter build ios --release


Navigate to the project directory:
Install dependencies:
Create assets folder and add required assets:
Run the application:
Project Structure
Building for Production
To build the release version of the app:

Troubleshooting
Kotlin Daemon Error
If you encounter "Could not connect to Kotlin compile daemon" error:

To clean the project:

flutter clean
cd android
./gradlew clean
cd ..
flutter pub get
