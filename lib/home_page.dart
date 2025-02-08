import 'package:flutter/material.dart';

class RFIDHomePage extends StatelessWidget {
  const RFIDHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[500],
        elevation: 0,
        toolbarHeight: screenHeight * 0.1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.nfc, size: screenWidth * 0.08),
            SizedBox(width: screenWidth * 0.02),
            Text(
              'RFID',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.06,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blueGrey[300],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/rfid_scanner');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.all(screenWidth * 0.1),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.black.withOpacity(0.2),
                        elevation: 8,
                        side: BorderSide(
                          color: Colors.black,
                          width: screenWidth * 0.007,
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        size: screenWidth * 0.25,
                        color: Colors.blueGrey[700],
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.05),
                    Text(
                      'ADD ASSET TAGS',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        color: Colors.blueGrey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  color: Colors.blueGrey[500],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[500],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.000),
                      topRight: Radius.circular(screenWidth * 0.000),
                      bottomLeft: Radius.circular(screenWidth * 0.00),
                      bottomRight: Radius.circular(screenWidth * 0.00),
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/rfid_back.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
