import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.4; // Responsive image size
    double padding = MediaQuery.of(context).size.width * 0.1; // Responsive padding

    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: Image.asset(
              'assets/rfid_asset.png',
              height: imageSize,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'RFID Asset Locator',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(
            'assets/middle_image.png',
            height: imageSize,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: const Text(
              '"Efficiently track, monitor, and locate valuable assets in real-time with RFID technology."',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(padding),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[900],
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: padding * 0.4,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
