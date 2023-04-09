import 'package:flutter/material.dart';

class CustomResultScreen extends StatelessWidget {
  final outputText;
  const CustomResultScreen({super.key, this.outputText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Result'),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16),
          child: Text(
            outputText,
            style: const TextStyle(fontSize: 32),
          )),
    );
  }
}
