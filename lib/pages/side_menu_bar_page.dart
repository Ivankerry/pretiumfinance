import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(''), // Empty title
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Profile section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'TP',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF757575),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Coming Soon',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'tilespoa1@gmail.com',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Divider(height: 1),

            // Menu Items
            _buildMenuItem(
              context,
              icon: Icons.attach_money,
              title: 'Currency',
              trailing: const Text(
                'KES',
                style: TextStyle(
                  color: Color(0xFF1B5E20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            _buildMenuItem(
              context,
              icon: Icons.account_balance_wallet,
              title: 'Assets',
              showForwardIcon: true,
            ),

            _buildMenuItem(
              context,
              icon: Icons.swap_horiz,
              title: 'Wallet Address',
              showForwardIcon: true,
            ),

            _buildMenuItem(
              context,
              icon: Icons.telegram,
              title: 'Contact Support',
              trailingIcon: Icons.open_in_new,
              trailingIconColor: const Color(0xFF1B5E20),
            ),

            _buildMenuItem(
              context,
              icon: Icons.description_outlined,
              title: 'Terms and Conditions',
              trailingIcon: Icons.open_in_new,
              trailingIconColor: const Color(0xFF1B5E20),
            ),

            _buildMenuItem(
              context,
              icon: Icons.security,
              title: 'Privacy Policy',
              trailingIcon: Icons.open_in_new,
              trailingIconColor: const Color(0xFF1B5E20),
            ),

            _buildMenuItem(
              context,
              icon: Icons.phone_android,
              title: 'App Version',
              trailing: const Text(
                '1.0.0+16',
                style: TextStyle(
                  color: Color(0xFF1B5E20),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            _buildMenuItem(
              context,
              icon: Icons.logout,
              title: 'Sign out',
              showForwardIcon: true,
            ),

            _buildMenuItem(
              context,
              icon: Icons.delete,
              title: 'Delete Account',
              showForwardIcon: true,
            ),

            const SizedBox(height: 50),

            // Rate App Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Rate App',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.thumb_up, color: Colors.amber, size: 20),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    Widget? trailing,
    IconData? trailingIcon,
    Color? trailingIconColor,
    bool showForwardIcon = false,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              SizedBox(
                width: 35,
                height: 35,
                child: Icon(icon, color: const Color(0xFF1B5E20), size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (trailing != null) trailing,
              if (trailingIcon != null)
                Icon(
                  trailingIcon,
                  color: trailingIconColor ?? Colors.grey,
                  size: 20,
                ),
              if (showForwardIcon)
                const Icon(Icons.chevron_right, color: Colors.grey, size: 24),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
