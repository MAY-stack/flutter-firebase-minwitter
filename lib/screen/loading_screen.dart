import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text(
        'Loading...',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
