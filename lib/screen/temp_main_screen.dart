import 'package:flutter/material.dart';

class TempMainScreen extends StatelessWidget {
  const TempMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temp Main Screen',
      home: Scaffold(
          body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/comments');
              },
              child: const Text('button'),
            ),
          ],
        ),
      )),
    );
  }
}
