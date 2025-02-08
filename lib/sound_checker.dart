import 'package:flutter/material.dart';
import 'dart:async';

class SoundCheckerPage extends StatefulWidget {
  const SoundCheckerPage({Key? key}) : super(key: key);

  @override
  _SoundCheckerPageState createState() => _SoundCheckerPageState();
}

class _SoundCheckerPageState extends State<SoundCheckerPage> {
  double _dbLevel = 0;
  String _proximityText = "Go near to the tag";

  @override
  void initState() {
    super.initState();
    _startDbSimulation();
  }

  void _startDbSimulation() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _dbLevel = (_dbLevel + 10) % 110;

        if (_dbLevel < 40) {
          _proximityText = "Go near to the tag";
        } else if (_dbLevel < 80) {
          _proximityText = "You have neared the tag";
        } else {
          _proximityText = "You have reached the tag";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Asset Proximity Checker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Asset Distance Indicator',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            const SizedBox(height: 40),
            // Simulated Flowbar
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.blueGrey[100],
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: _dbLevel * 3, // Scale dbLevel for visual effect
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Dynamic db level display
            Text(
              "${_dbLevel.toInt()} dB",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _proximityText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const Text(
              "Move closer to the asset tag to increase the sound level.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
