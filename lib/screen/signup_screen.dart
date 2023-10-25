import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Login to ✖️';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Center(
            child: Text(
              appTitle,
              style: TextStyle(fontSize: 30),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _signUpKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    String inputEmail = '';
    String inputPassword = '';
    // Build a Form widget using the _formKey created above.
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: 420,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(60)),
            color: Colors.white,
          ),
          child: const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          width: 420,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(60)),
            color: Colors.white,
          ),
          child: const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          width: 420,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(60)),
            color: Colors.white,
          ),
          child: const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          width: 420,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(60)),
            color: Colors.white,
          ),
          child: const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
