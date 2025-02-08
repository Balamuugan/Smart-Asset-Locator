import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SETTINGS',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[300],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background1.jpg'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/settings_background.jpg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
                ...buildSettingsOptions(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildSettingsOptions(BuildContext context) {
    return [
      buildListTile(
        context,
        Icons.info,
        'About Us',
        'Smart Asset Locator helps track your valuable items with RFID. Simplify your life by never losing track of important assets.',
      ),
      buildListTile(
        context,
        Icons.help,
        'App Guide',
        'To use the app, add tags, use search to find items, and view status. For instructions, refer to the app user manual.',
      ),
      buildListTile(
        context,
        Icons.description,
        'Terms & Conditions',
        'By using Smart Asset Locator, you agree to our terms, privacy policies, and responsibility terms.',
      ),
      buildListTile(
        context,
        Icons.feedback,
        'Help & Feedback',
        'For help and feedback, contact support@smartassetlocator.com.',
      ),
      buildListTile(
        context,
        Icons.star_rate,
        'Rate Our App',
        'Please rate our app on the store and give feedback for improvements!',
      ),
    ];
  }

  ListTile buildListTile(BuildContext context, IconData icon, String title, String content) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(title),
            ),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
