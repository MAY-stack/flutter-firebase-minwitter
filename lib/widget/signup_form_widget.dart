import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Create a Form widget.
class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  SignupFormState createState() {
    return SignupFormState();
  }
}

// This class holds data related to the form.
class SignupFormState extends State<SignupForm> {
  bool isLoading = false;
  // Create a global key that uniquely identifies the Form widget and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState> not a GlobalKey<SignupFormState>.
  final _signupFormKey = GlobalKey<FormState>();

  String userName = '';
  String userEmail = '';
  String userPassword = '';

  String signupError = '';

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _signupFormKey created above.
    return Form(
      key: _signupFormKey,
      child: Center(
        child: SizedBox(
          width: 420,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 420,
                decoration: BoxDecoration(
                  color: Colors.white, // 배경 색상
                  borderRadius: BorderRadius.circular(30.0), // 모서리를 더 둥글게 설정
                ), // 원하는 가로 크기 설정
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      color: Colors.black, // 힌트 텍스트의 색상
                      fontSize: 16.0, // 힌트 텍스트의 글꼴 크기
                      fontWeight: FontWeight.bold, // 힌트 텍스트의 글꼴 굵기
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 16.0, // 입력된 텍스트의 글꼴 크기
                    color: Colors.black, // 입력된 텍스트의 색상
                    fontWeight: FontWeight.bold, // 입력된 텍스트의 글꼴 굵기
                  ),
                  validator: (inputName) {
                    if (inputName == null || inputName.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      userName = inputName;
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: 420,
                decoration: BoxDecoration(
                  color: Colors.white, // 배경 색상
                  borderRadius: BorderRadius.circular(30.0), // 모서리를 더 둥글게 설정
                ), // 원하는 가로 크기 설정
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.black, // 힌트 텍스트의 색상
                      fontSize: 16.0, // 힌트 텍스트의 글꼴 크기
                      fontWeight: FontWeight.bold, // 힌트 텍스트의 글꼴 굵기
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 16.0, // 입력된 텍스트의 글꼴 크기
                    color: Colors.black, // 입력된 텍스트의 색상
                    fontWeight: FontWeight.bold, // 입력된 텍스트의 글꼴 굵기
                  ),
                  validator: (inputEmail) {
                    if (inputEmail == null || inputEmail.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      userEmail = inputEmail;
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: 420,
                decoration: BoxDecoration(
                  color: Colors.white, // 배경 색상
                  borderRadius: BorderRadius.circular(30.0), // 모서리를 더 둥글게 설정
                ), // 원하는 가로 크기 설정
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.black, // 힌트 텍스트의 색상
                      fontSize: 16.0, // 힌트 텍스트의 글꼴 크기
                      fontWeight: FontWeight.bold, // 힌트 텍스트의 글꼴 굵기
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 16.0, // 입력된 텍스트의 글꼴 크기
                    color: Colors.black, // 입력된 텍스트의 색상
                    fontWeight: FontWeight.bold, // 입력된 텍스트의 글꼴 굵기
                  ),
                  validator: (inputPassword) {
                    if (inputPassword == null || inputPassword.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      userPassword = inputPassword;
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // 배경 색을 흰색으로 설정
                      minimumSize: const Size(420, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // 모서리를 더 둥글게 설정
                      ), // 버튼 크기 설정
                    ),
                    onPressed: () async {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_signupFormKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        // ScaffoldMessenger.of(context).showSnackBar(
                        try {
                          isLoading = true;
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: userEmail, password: userPassword);
                          await FirebaseAuth.instance.currentUser!
                              .updateDisplayName(userName);
                          Navigator.pushNamed(context, '/profile');
                        } catch (e) {
                          setState(() {
                            signupError = e.toString();
                          });
                          print(e);
                        } finally {}
                      }
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Text('에러: $signupError'),
            ],
          ),
        ),
      ),
    );
  }
}
