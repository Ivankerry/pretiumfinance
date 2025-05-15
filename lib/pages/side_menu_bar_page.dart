import 'package:flutter/material.dart'; // Imports the Flutter Material Design library for UI widgets.

// A stateless widget representing the profile screen.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key})
    : super(
        key: key,
      ); // Constructor for the ProfileScreen widget, taking an optional Key.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Provides the basic visual structure for a Material Design app.
      backgroundColor:
          Colors.white, // Sets the background color of the scaffold to white.
      appBar: AppBar(
        // Displays a toolbar at the top of the screen.
        backgroundColor:
            Colors.white, // Sets the background color of the app bar to white.
        elevation: 0, // Removes the shadow below the app bar.
        leading: IconButton(
          // A button that typically displays an icon.
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), // Displays a back arrow icon in black color.
          onPressed: () {
            // Function to be executed when the back button is pressed.
            Navigator.pop(context); // Navigates back to the previous screen.
          },
        ),
        title: const Text(
          '',
        ), // An empty text widget for the title, effectively making it blank.
      ),
      body: SingleChildScrollView(
        // A scrollable view that allows scrolling in a single direction.
        child: Column(
          // Arranges its children in a vertical line.
          children: [
            const SizedBox(height: 10), // Adds vertical spacing.
            // Profile section
            Padding(
              // Adds padding around the profile information.
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ), // Adds symmetric horizontal padding.
              child: Row(
                // Arranges its children in a horizontal line.
                children: [
                  Container(
                    // A container widget for the profile image/initials.
                    width: 80, // Sets the width of the container.
                    height: 80, // Sets the height of the container.
                    decoration: const BoxDecoration(
                      // Defines the appearance of the container.
                      color: Color(
                        0xFFE0E0E0,
                      ), // Sets the background color to light grey.
                      shape: BoxShape.circle, // Makes the container circular.
                    ),
                    child: const Center(
                      // Centers its child within itself.
                      child: Text(
                        // Displays the user's initials.
                        'TP',
                        style: TextStyle(
                          // Styles the text.
                          fontSize: 30, // Sets the font size to 30.
                          color: Color(
                            0xFF757575,
                          ), // Sets the text color to grey.
                          fontWeight:
                              FontWeight
                                  .w500, // Sets the font weight to medium.
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20), // Adds horizontal spacing.
                  Expanded(
                    // Makes the following column take up the remaining horizontal space.
                    child: Column(
                      // Arranges its children in a vertical line.
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start, // Aligns the children to the start of the row.
                      children: [
                        Row(
                          // Arranges the name and edit icon horizontally.
                          children: [
                            const Text(
                              // Displays the user's name (currently "Coming Soon").
                              'Coming Soon',
                              style: TextStyle(
                                // Styles the text.
                                fontSize: 22, // Sets the font size to 22.
                                fontWeight:
                                    FontWeight
                                        .bold, // Sets the font weight to bold.
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ), // Adds horizontal spacing.
                            Icon(
                              // Displays an edit icon.
                              Icons.edit,
                              size: 20, // Sets the size of the icon.
                              color: Colors.black.withOpacity(
                                0.7,
                              ), // Sets the color with some transparency.
                            ),
                          ],
                        ),
                        const SizedBox(height: 4), // Adds vertical spacing.
                        const Text(
                          // Displays the user's email address.
                          'tilespoa1@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ), // Styles the text.
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30), // Adds vertical spacing.
            const Divider(
              height: 1,
            ), // A thin horizontal line to visually separate sections.
            // Menu Items
            _buildMenuItem(
              // Calls a method to build a menu item.
              context, // Passes the current build context.
              icon: Icons.attach_money, // Sets the leading icon.
              title: 'Currency', // Sets the title of the menu item.
              trailing: const Text(
                // Sets a trailing widget (text in this case).
                'KES',
                style: TextStyle(
                  // Styles the trailing text.
                  color: Color(0xFF1B5E20), // Sets the color to a green shade.
                  fontWeight: FontWeight.bold, // Sets the font weight to bold.
                ),
              ),
            ),

            _buildMenuItem(
              // Calls a method to build a menu item.
              context, // Passes the current build context.
              icon: Icons.account_balance_wallet, // Sets the leading icon.
              title: 'Assets', // Sets the title of the menu item.
              showForwardIcon: true, // Shows a forward arrow icon at the end.
            ),

            _buildMenuItem(
              // Calls a method to build a menu item.
              context, // Passes the current build context.
              icon: Icons.swap_horiz, // Sets the leading icon.
              title: 'Wallet Address', // Sets the title of the menu item.
              showForwardIcon: true, // Shows a forward arrow icon at the end.
            ),

            _buildMenuItem(
              // Calls a method to build a menu item.
              context, // Passes the current build context.
              icon: Icons.telegram, // Sets the leading icon.
              title: 'Contact Support', // Sets the title of the menu item.
              trailingIcon: Icons.open_in_new, // Sets a trailing icon.
              trailingIconColor: const Color(
                0xFF1B5E20,
              ), // Sets the color of the trailing icon.
            ),

            _buildMenuItem(
              // Calls a method to build a menu item.
              context, // Passes the current build context.
              icon: Icons.description_outlined, // Sets the leading icon.
              title: 'Terms and Conditions', // Sets the title of the menu item.
              trailingIcon: Icons.open_in_new, // Sets a trailing icon.
              trailingIconColor: const Color(
                0xFF1B5E20,
              ), // Sets the color of the trailing icon.
            ),

            _buildMenuItem(
              // Calls a method to build a menu item.
              context, // Passes the current build context.
              icon: Icons.security, // Sets the leading icon.
              title: 'Privacy Policy', // Sets the title of the menu item.
              trailingIcon: Icons.open_in_new, // Sets a trailing icon.
              trailingIconColor: const Color(
                0xFF1B5E20,
              ), // Sets the color of the trailing icon.
            ),

            _buildMenuItem(
              // Calls a method to build a menu item.
              context, // Passes the current build context.
              icon: Icons.phone_android, // Sets the leading icon.
              title: 'App Version', // Sets the title of the menu item.
              trailing: const Text(
                // Sets a trailing widget (text in this case).
                '1.0.0+16',
                style: TextStyle(
                  // Styles the trailing text.
                  color: Color(0xFF1B5E20), // Sets the color to a green shade.
                  fontWeight:
                      FontWeight.w500, // Sets the font weight to medium.
                ),
              ),
            ),

            _buildMenuItem(
              // Calls a method to build a menu item.
              context, // Passes the current build context.
              icon: Icons.logout, // Sets the leading icon.
              title: 'Sign out', // Sets the title of the menu item.
              showForwardIcon: true, // Shows a forward arrow icon at the end.
            ),

            _buildMenuItem(
              // Calls a method to build a menu item.
              context, // Passes the current build context.
              icon: Icons.delete, // Sets the leading icon.
              title: 'Delete Account', // Sets the title of the menu item.
              showForwardIcon: true, // Shows a forward arrow icon at the end.
            ),

            const SizedBox(height: 50), // Adds vertical spacing.
            // Rate App Button
            Container(
              // A container for the rate app button.
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ), // Adds symmetric padding.
              decoration: BoxDecoration(
                // Defines the appearance of the container.
                color: Colors.grey.withOpacity(
                  0.1,
                ), // Sets a light grey background with some transparency.
                borderRadius: BorderRadius.circular(
                  25,
                ), // Sets rounded corners.
              ),
              child: Row(
                // Arranges its children horizontally.
                mainAxisSize:
                    MainAxisSize
                        .min, // Makes the row take up only the necessary width.
                children: [
                  const Text(
                    // Displays the "Rate App" text.
                    'Rate App',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ), // Styles the text.
                  ),
                  const SizedBox(width: 8), // Adds horizontal spacing.
                  const Icon(
                    Icons.thumb_up,
                    color: Colors.amber,
                    size: 20,
                  ), // Displays a thumbs-up icon in amber color.
                ],
              ),
            ),

            const SizedBox(height: 30), // Adds vertical spacing at the bottom.
          ],
        ),
      ),
    );
  }

  // A reusable widget to build a menu item in the profile screen.
  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon, // The leading icon for the menu item.
    required String title, // The title of the menu item.
    Widget? trailing, // An optional widget to display at the end (e.g., text).
    IconData? trailingIcon, // An optional icon to display at the end.
    Color? trailingIconColor, // An optional color for the trailing icon.
    bool showForwardIcon =
        false, // A boolean to control the visibility of the forward arrow icon.
  }) {
    return Column(
      // Arranges the menu item content and the divider vertically.
      children: [
        Container(
          // A container for the menu item content.
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ), // Adds symmetric padding.
          child: Row(
            // Arranges the icon, title, and trailing elements horizontally.
            children: [
              SizedBox(
                // A sized box to constrain the leading icon.
                width: 35,
                height: 35,
                child: Icon(
                  icon,
                  color: const Color(0xFF1B5E20),
                  size: 22,
                ), // Displays the leading icon with a specific color and size.
              ),
              const SizedBox(width: 12), // Adds horizontal spacing.
              Expanded(
                // Makes the title take up the remaining horizontal space.
                child: Text(
                  // Displays the title of the menu item.
                  title,
                  style: const TextStyle(
                    // Styles the text.
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (trailing != null)
                trailing, // Displays the trailing widget if provided.
              if (trailingIcon !=
                  null) // Displays the trailing icon if provided.
                Icon(
                  trailingIcon,
                  color:
                      trailingIconColor ??
                      Colors
                          .grey, // Uses the provided color or grey as a default.
                  size: 20,
                ),
              if (showForwardIcon) // Displays the forward arrow icon if showForwardIcon is true.
                const Icon(Icons.chevron_right, color: Colors.grey, size: 24),
            ],
          ),
        ),
        const Divider(height: 1), // A thin horizontal line below the menu item.
      ],
    );
  }
}
