import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minwitter/widget/github_button_widget.dart';

class ProtectedScreen extends StatelessWidget {
  const ProtectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      //로그인되어 있으면
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              children: [
                Text(
                  '${user.email}',
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('로그아웃'),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      '회원가입',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const GitHubBotton(),
            ],
          ),
        ),
      ),
    );
  }
}
