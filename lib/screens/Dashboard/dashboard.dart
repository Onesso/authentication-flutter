import 'package:flutter/material.dart';
import 'Home/home_screen.dart';
import 'SendRequest/send_request.dart';
import 'Wallet/wallet_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // List of pages to display
  final List<Widget> _pages = const [Homescreen(), SendRequest(), Wallet()];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double navigationBarHeight = screenHeight * 0.07;

    return Scaffold(
      resizeToAvoidBottomInset: true,

      // Display the selected page
      body: _pages[_selectedIndex],

      // NavigationBar (Material 3)
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        indicatorColor: Colors.transparent,
        height: navigationBarHeight,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

        // Define the style for the labels based on their state
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
          Set<WidgetState> states,
        ) {
          // If the destination is selected, use the blue color
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 12,
            );
          }
          // Otherwise, use the grey color for unselected labels
          return const TextStyle(
            color: Colors.grey,
            fontFamily: 'Roboto',
            fontSize: 12,
          );
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Colors.grey, size: 30.0),
            selectedIcon: Icon(
              Icons.home_outlined,
              color: Colors.black,
              size: 32.0,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.swap_horiz, color: Colors.grey, size: 30.0),
            ),
            selectedIcon: RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.swap_horiz, color: Colors.black, size: 32.0),
            ),
            label: "Send/Request",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              size: 30.0,
              color: Colors.grey,
            ),
            selectedIcon: Icon(
              Icons.account_balance_wallet_outlined,
              size: 32.0,
            ),
            label: "Wallet",
          ),
        ],
      ),
    );
  }
}
