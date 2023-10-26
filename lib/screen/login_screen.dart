import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:minwitter/screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = ''; // 이메일을 저장할 변수
  String password = ''; // 비밀번호를 저장할 변수
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 420,
            decoration: BoxDecoration(
              color: Colors.white, // 배경 색상
              borderRadius: BorderRadius.circular(10.0), // 모서리를 더 둥글게 설정
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: '이메일',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) {
                      // 이메일이 변경될 때마다 실행되는 콜백
                      email = value; // 이메일 변수에 저장
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: '비밀번호',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) {
                      // 비밀번호가 변경될 때마다 실행되는 콜백
                      password = value; // 비밀번호 변수에 저장
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          Logger().i('로그인 성공');
                          // 로그인 성공
                        } catch (e) {
                          // 로그인 실패 시 에러 처리
                          print(e.toString());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(420, 50),
                      ),
                      child: const Text(
                        '로그인',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
