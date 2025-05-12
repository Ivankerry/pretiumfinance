import 'package:flutter/material.dart';
import 'floating_text_field.dart'; // Custom widget for text input fields with floating labels
import 'verify_account_page.dart'; // The page to navigate to after account creation

// Entry point for the sign-up screen
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

// State class for handling input, validation, and navigation
class _SignUpPageState extends State<SignUpPage> {
  // Checkbox state for terms acceptance
  bool _termsAccepted = false;

  // Controllers to handle user input
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Clean up controllers when the widget is disposed
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Method to validate inputs and navigate to verification page
  void _createAccount() {
    // Basic empty field check
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    }

    // Email format check
    if (!_emailController.text.contains('@')) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter a valid email')));
      return;
    }

    // Password strength check
    if (_passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password must be at least 6 characters')),
      );
      return;
    }

    // If all validations pass, navigate to account verification page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => VerifyAccountPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Introductory text
                Text(
                  'Simplify your crypto payments with us',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 20),

                // First Name input
                FloatingTextField(
                  controller: _firstNameController,
                  labelText: 'First Name',
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: 20),

                // Last Name input
                FloatingTextField(
                  controller: _lastNameController,
                  labelText: 'Last Name',
                  prefixIcon: Icons.person_outline,
                ),
                SizedBox(height: 20),

                // Email input
                FloatingTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: 20),

                // Password input (obscured)
                FloatingTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(height: 10),

                // Terms and conditions checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (bool? value) {
                        setState(() {
                          _termsAccepted = value ?? false;
                        });
                      },
                      activeColor: Colors.teal,
                    ),
                    Expanded(
                      child: Text(
                        'Accept Terms and Conditions',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Submit button
                ElevatedButton(
                  onPressed: _termsAccepted ? _createAccount : null,
                  child: Text('Create Account'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Redirect to login if user already has an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Navigate back to login
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
