import 'package:flutter/material.dart';
import 'package:minwitter/widget/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'Join 𝕄',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SignupForm(),
      ),
    );
  }
}
