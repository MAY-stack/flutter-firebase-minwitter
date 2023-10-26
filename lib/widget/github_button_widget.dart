import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GitHubBotton extends StatelessWidget {
  const GitHubBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          GithubAuthProvider githubProvider = GithubAuthProvider();
          await FirebaseAuth.instance.signInWithRedirect(githubProvider);
          Navigator.pushNamed(context, '/');
        } catch (e) {
          print(e);
        }
      },
      child: const Text('Sign in with GitHub'),
    );
  }
}
