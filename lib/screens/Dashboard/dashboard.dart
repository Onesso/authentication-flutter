import 'package:flutter/material.dart';
import 'Home/home_screen.dart';
import 'SendRequest/send_request.dart';
import 'Wallet/wallet_screen.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [Homescreen(), SendRequest(), Wallet()];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double navigationBarHeight = screenHeight * 0.09;

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
              fontSize: 10,
            );
          }
          // Otherwise, use the grey color for unselected labels
          return const TextStyle(
            color: Colors.grey,
            fontFamily: 'Roboto',
            fontSize: 10,
          );
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Symbols.home, weight: 200, size: 40, color: Colors.grey),
            selectedIcon: Icon(
              Symbols.home,
              weight: 300,
              size: 40,
              color: Colors.black,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Symbols.swap_horiz,
                weight: 200,
                size: 40,
                color: Colors.grey,
              ),
            ),
            selectedIcon: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Symbols.swap_horiz,
                weight: 300,
                size: 40,
                color: Colors.black,
              ),
            ),
            label: "Send/Request",
          ),
          NavigationDestination(
            icon: Icon(
              Symbols.wallet,
              weight: 200, // or whatever weight you want
              size: 40,
              color: Colors.grey,
            ),
            selectedIcon: Icon(
              Symbols.wallet,
              weight: 300, // or whatever weight you want
              size: 40,
              color: Colors.black,
            ),
            label: "Wallet",
          ),
        ],
      ),
    );
  }
}
