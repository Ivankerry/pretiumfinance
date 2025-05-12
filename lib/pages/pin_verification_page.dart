import 'package:flutter/material.dart';
import 'landing_page.dart';

// Move the enum outside the class
enum PinStage { create, confirm }

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({Key? key}) : super(key: key);

  @override
  _PinVerificationScreenState createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  PinStage _currentStage = PinStage.create;
  String _initialPin = '';
  String _currentPin = '';

  // Visual indicator of entered PIN
  List<bool> get _pinEnteredDots {
    return List.generate(4, (index) => index < _currentPin.length);
  }

  void _onNumberPressed(int number) {
    setState(() {
      if (_currentPin.length < 4) {
        _currentPin += number.toString();
      }
    });

    // Automatically proceed if 4 digits entered
    if (_currentPin.length == 4) {
      _handlePinEntry();
    }
  }

  void _handlePinEntry() {
    switch (_currentStage) {
      case PinStage.create:
        // First PIN entry
        _initialPin = _currentPin;
        _currentPin = '';
        _currentStage = PinStage.confirm;
        break;

      case PinStage.confirm:
        if (_currentPin == _initialPin) {
          // PIN successfully created - navigate directly to landing page
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MobileBankingHomeScreen()),
            (route) => false, // Remove all previous routes
          );
        } else {
          // PINs don't match
          _showErrorDialog();
        }
        break;
    }
  }

  void _clearPin() {
    setState(() {
      _currentPin = '';
    });
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('PIN Mismatch'),
            content: const Text(
              'The PINs you entered do not match. Please try again.',
            ),
            actions: [
              TextButton(
                child: const Text('Try Again'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _currentStage = PinStage.create;
                    _currentPin = '';
                    _initialPin = '';
                  });
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF128C7E),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lock icon
            const Icon(Icons.lock_outline, size: 80, color: Colors.white),
            const SizedBox(height: 20),

            // Stage description
            Text(
              _currentStage == PinStage.create
                  ? 'Create Your 4-digit PIN'
                  : 'Re-enter Your PIN to Confirm',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // PIN dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _pinEnteredDots[index]
                            ? Colors.white
                            : Colors.white.withOpacity(0.3),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            Text(
              _currentStage == PinStage.create
                  ? 'Your PIN will be required to access the app'
                  : 'Your PIN will be required to access the app',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            // Numeric Keypad
            _buildNumericKeypad(),
          ],
        ),
      ),
    );
  }

  Widget _buildNumericKeypad() {
    return Column(
      children: [
        // Numeric rows
        _buildNumericRow([1, 2, 3]),
        _buildNumericRow([4, 5, 6]),
        _buildNumericRow([7, 8, 9]),
        // Last row with 0 and backspace
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 80),
            _buildNumericButton(0),
            _buildBackspaceButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildNumericRow(List<int> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: numbers.map(_buildNumericButton).toList(),
    );
  }

  Widget _buildNumericButton(int number) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.2),
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () => _onNumberPressed(number),
        child: Text(number.toString(), style: const TextStyle(fontSize: 24)),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.2),
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        onPressed: _clearPin,
        child: const Icon(Icons.backspace_outlined, size: 24),
      ),
    );
  }
}
