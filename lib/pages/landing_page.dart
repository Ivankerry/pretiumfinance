import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
  double _accountBalance = 0.0;
  String _currency = 'USD';
  List<Map<String, dynamic>> _transactions = [];
  bool _isLoading = true; // Add a loading state

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  // Fetch both account balance and transaction history
  Future<void> _fetchData() async {
    try {
      await Future.wait([_fetchAccountBalance(), _fetchTransactionHistory()]);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      setState(() {
        _isLoading = false; // Set loading to false after fetching data
      });
    }
  }

  // Fetch account balance from the API
  Future<void> _fetchAccountBalance() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.239.46:3000/api/balance/user123'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _accountBalance = data['balance'];
          _currency = data['currency'];
        });
      } else {
        print('Failed to fetch account balance');
      }
    } catch (e) {
      print('Error fetching account balance: $e');
    }
  }

  // Fetch transaction history from the API
  Future<void> _fetchTransactionHistory() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.239.46:3000/api/transactions/user123'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _transactions = List<Map<String, dynamic>>.from(data);
        });
      } else {
        print('Failed to fetch transaction history');
      }
    } catch (e) {
      print('Error fetching transaction history: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body:
          _isLoading
              ? Center(
                child: CircularProgressIndicator(),
              ) // Show loading indicator
              : SingleChildScrollView(
                child: Column(
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
                                MaterialPageRoute(
                                  builder: (context) => ProfileScreen(),
                                ),
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
                          Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                          ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        '$_currency ${_accountBalance.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
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
                                    SizedBox(height: 40),
                                    Text(
                                      'Wallet Balance',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '****',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Wrapped each service icon in Expanded with padding for better spacing
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: _buildServiceIcon(
                                        Icons.send,
                                        'Send Money',
                                      ),
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
                                      child: _buildServiceIcon(
                                        Icons.receipt,
                                        'Paybill',
                                      ),
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

                    // Recent Transactions Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Transactions',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
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

                    // Displaying recent transactions
                    ListView.builder(
                      shrinkWrap:
                          true, // Ensures the ListView takes only the required space
                      physics:
                          NeverScrollableScrollPhysics(), // Prevents nested scrolling
                      itemCount: _transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = _transactions[index];
                        return ListTile(
                          leading: Icon(
                            transaction['type'] == 'deposit'
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                            color:
                                transaction['type'] == 'deposit'
                                    ? Colors.green
                                    : Colors.red,
                          ),
                          title: Text(transaction['description']),
                          subtitle: Text(transaction['date']),
                          trailing: Text(
                            '${transaction['type'] == 'deposit' ? '+' : '-'}${transaction['amount']} $_currency',
                            style: TextStyle(
                              color:
                                  transaction['type'] == 'deposit'
                                      ? Colors.green
                                      : Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // Background color of the BottomAppBar
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Space items evenly
          children: [
            IconButton(
              icon: Icon(Icons.wallet_outlined, color: const Color(0xFF128C7E)),
              onPressed: () {
                // Add navigation or functionality here
              },
            ),
            // Center QR code button
            Transform.translate(
              offset: Offset(0, -15), // Move up by 15 pixels
              child: FloatingActionButton(
                backgroundColor: const Color(0xFF128C7E),
                onPressed: () {
                  // Add QR code functionality here
                },
                child: Icon(Icons.qr_code_rounded, color: Colors.white),
              ),
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.grey),
              onPressed: () {
                // Navigate to the TransactionsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionsPage()),
                );
              },
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
