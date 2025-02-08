// main.dart

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'search_page.dart';
import 'welcome_page.dart';
import 'login_signup.dart';
import 'rfid_scanner.dart';
import 'sound_checker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'OpenSans',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/home': (context) => const MainPage(),
        '/login': (context) => const LoginSignupPage(),
        '/rfid_scanner': (context) => const RfidScannerPage(),
        '/sound_checker': (context) => const SoundCheckerPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const RFIDHomePage(),
    const SearchPage(),
    const SettingsPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _children[_currentIndex],
      backgroundColor: Colors.blueGrey[300],
      bottomNavigationBar: Container(
        color: Colors.blueGrey[300],
        padding: EdgeInsets.only(bottom: screenWidth * 0.04),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: _currentIndex == 0
                      ? _buildSelectedIcon(Icons.home, screenWidth)
                      : Icon(Icons.home, size: screenWidth * 0.1),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _currentIndex == 1
                      ? _buildSelectedIcon(Icons.search, screenWidth)
                      : Icon(Icons.search, size: screenWidth * 0.1),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: _currentIndex == 2
                      ? _buildSelectedIcon(Icons.settings, screenWidth)
                      : Icon(Icons.settings, size: screenWidth * 0.1),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedIcon(IconData icon, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.02),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: screenWidth * 0.1, color: Colors.black),
    );
  }
}
