import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class RfidScannerPage extends StatefulWidget {
  const RfidScannerPage({super.key});

  @override
  _RfidScannerPageState createState() => _RfidScannerPageState();
}

class _RfidScannerPageState extends State<RfidScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanning = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    controller?.scannedDataStream.listen((scanData) {
      setState(() {
        isScanning = false;
      });
      controller?.pauseCamera();
      Navigator.pop(context, scanData.code);
    });
  }

  void openScanner() {
    setState(() {
      isScanning = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: screenWidth * 0.07),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'RFID SCANNER',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.05,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Image.asset(
                  'assets/rfid_scanner1.png',
                  height: screenHeight * 0.25,
                  width: screenHeight * 0.25,
                ),
                SizedBox(height: screenHeight * 0.05),
                ElevatedButton.icon(
                  onPressed: openScanner,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[500],
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.2,
                      vertical: screenHeight * 0.025,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                    size: screenWidth * 0.08,
                  ),
                  label: Text(
                    ' Scan your RFID Tag',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  '"Your assets, always within reach – one scan away."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Code for reset functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[700],
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.25,
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
              ],
            ),
          ),
          if (isScanning)
            Positioned.fill(
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.blueGrey[700]!,
                  borderRadius: 10,
                  borderLength: screenWidth * 0.08,
                  borderWidth: screenWidth * 0.025,
                  cutOutSize: screenWidth * 0.8,
                ),
              ),
            ),
        ],
      ),
      backgroundColor: Colors.blueGrey[50],
    );
  }
}
