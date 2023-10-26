import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = 'FirebaseAuth.instance.currentUser!.displayName';
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Avatar(),
              Text('User Name:$userName'),
            ],
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.emoji_emotions_outlined,
      size: 100,
    );
  }
}
