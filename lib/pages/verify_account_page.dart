import 'package:flutter/material.dart';
import 'pin_verification_page.dart';

class VerifyAccountPage extends StatefulWidget {
  @override
  _VerifyAccountPageState createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage> {
  bool _isCodeResent = false;

  void _resendCode() {
    setState(() {
      _isCodeResent = true;
    });

    // Simulate hiding the resent message after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isCodeResent = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Verify Account'),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Verify Account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Enter the verification code sent to your email',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items:
                    // List of countries
                    [
                          'Kenya',
                          'Uganda',
                          'Nigeria',
                          'Ghana',
                          'Malawi',
                          'Zambia',
                          'Rwanda',
                          'Rwanda',
                          'Global Users [全球用户]',
                        ]
                        .map(
                          (country) => DropdownMenuItem(
                            child: Text(country),
                            value: country,
                          ),
                        )
                        .toList(),
                onChanged: (value) {},
                value: 'Kenya',
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Verification Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(Icons.shield, color: Colors.teal),
                  hintText: '1234',
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, letterSpacing: 10),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the PinVerificationScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PinVerificationScreen(),
                    ),
                  );
                },
                child: Text('Verify Account'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white, // Add this for text color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Didn\'t receive the code? '),
                  GestureDetector(
                    onTap: _resendCode,
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              // Resend code confirmation banner
              if (_isCodeResent)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    color: Colors.teal.shade50,
                    child: Text(
                      'Verification code resent',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
