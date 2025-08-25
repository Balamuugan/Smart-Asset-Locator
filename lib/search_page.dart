import 'package:flutter/material.dart';
// Import SoundCheckerPage here
import 'sound_checker.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  final List<Map<String, String>> _assets = [
    {"image": 'assets/watch1.png', "name": 'LG WATCH 7', "status": 'RFID ACTIVE'},
    {"image": 'assets/lap.png', "name": 'LAPTOP', "status": 'RFID ACTIVE'},
    {"image": 'assets/ac_remote.png', "name": 'AC REMOTE', "status": 'RFID ACTIVE'},
    {"image": 'assets/airpod.png', "name": 'EAR BUDS', "status": 'RFID ACTIVE'},
    {"image": 'assets/file1.jpg', "name": 'FILE', "status": 'RFID ACTIVE'},
    {"image": 'assets/charger.png', "name": 'CHARGER', "status": 'RFID ACTIVE'},
    {"image": 'assets/document.png', "name": 'HOUSE DOCUMENT', "status": 'RFID ACTIVE'},
    {"image": 'assets/aadhar.png', "name": 'AADHAR CARD', "status": 'RFID ACTIVE'},
    // Additional assets...
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredAssets = _assets.where((asset) {
      return asset["name"]!.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Find Your Assett', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your asset',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                itemCount: filteredAssets.length,
                itemBuilder: (context, index) {
                  final asset = filteredAssets[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to SoundCheckerPage when an asset is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SoundCheckerPage()),
                      );
                    },
                    child: AssetItem(
                      image: asset["image"]!,
                      name: asset["name"]!,
                      status: asset["status"]!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssetItem extends StatelessWidget {
  final String image;
  final String name;
  final String status;

  const AssetItem({super.key, required this.image, required this.name, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 80,
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            status,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
