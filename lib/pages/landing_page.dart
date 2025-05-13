import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'transactions_page.dart';
import 'side_menu_bar_page.dart'; // Add this import for ProfileScreen

class MobileBankingHomeScreen extends StatefulWidget {
  const MobileBankingHomeScreen({Key? key}) : super(key: key);

  @override
  _MobileBankingHomeScreenState createState() =>
      _MobileBankingHomeScreenState();
}

class _MobileBankingHomeScreenState extends State<MobileBankingHomeScreen> {
  bool _balanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top App Bar - extends edge to edge, including status bar
          Container(
            width: double.infinity,
            // Add extra padding at the top to account for status bar height
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 12.0,
              bottom: 12.0,
              left: 16.0,
              right: 16.0,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF128C7E),
                  const Color(0xFF128C7E).withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profile Circular Avatar with GestureDetector
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      'K',
                      style: TextStyle(
                        color: const Color(0xFF128C7E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Centered Greeting
                Expanded(
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        children: [TextSpan(text: 'Hello, Kerry 👋')],
                      ),
                    ),
                  ),
                ),

                // Notification Icon
                Icon(Icons.notifications_none_outlined, color: Colors.white),
              ],
            ),
          ),

          // Wallet Balance Card
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF128C7E),
                      const Color(0xFF128C7E).withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icons row - wallet icon and visibility icon with circular backgrounds
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Wallet icon with rectangular background and rounded corners
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // Rounded corners
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.account_balance_wallet,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Visibility icon with circular background
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _balanceVisible = !_balanceVisible;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _balanceVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),

                    if (_balanceVisible)
                      // Visible mode layout
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              'Wallet Balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'KES 0.00',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // USD Amount container
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '\$ 0.00',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      // Hidden mode layout
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Empty space to push content down
                          SizedBox(height: 40),
                          // Wallet Balance and masked amount
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wallet Balance',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'KES ******',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),

          // Financial Services
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Financial Services',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Text('Kenya'),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // First row: Send Money, Buy Goods, Paybill
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Wrapped each service icon in Expanded with padding for better spacing
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: _buildServiceIcon(Icons.send, 'Send Money'),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: _buildServiceIcon(
                              Icons.shopping_basket,
                              'Buy Goods',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: _buildServiceIcon(Icons.receipt, 'Paybill'),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildServiceIcon(
                              Icons.phone_android,
                              'Airtime',
                            ),
                          ),
                          // Empty expanded widgets to maintain alignment
                          Expanded(child: Container()),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Recent Transactions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(color: const Color(0xFF128C7E)),
                  ),
                ),
              ],
            ),
          ),

          // No Transactions Placeholder
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt_long_outlined,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No recent transactions',
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 60,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.wallet_outlined,
                  color: const Color(0xFF128C7E),
                ),
                onPressed: () {},
              ),
            ),

            // Center QR code button (elevated)
            Transform.translate(
              offset: Offset(0, -15), // Move up by 15 pixels
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF128C7E),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.qr_code_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {},
                ),
              ),
            ),

            Expanded(
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.grey),
                onPressed: () {
                  // Navigate to the TransactionsPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransactionsPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFF128C7E).withOpacity(0.1),
          child: Icon(icon, color: const Color(0xFF128C7E), size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
      ],
    );
  }
}
