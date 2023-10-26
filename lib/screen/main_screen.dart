import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minwitter/screen/loading_screen.dart';
import 'package:minwitter/screen/signup_screen.dart';
import 'package:minwitter/widget/bottom_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      // setState(() {
      isLoading = false;
      // });
    });

    // 현재 로그인 상태 확인 authStateChanges()
    //리스너 등록 직후, 사용자 로그인시, 현재 사용자가 로그아웃 시 작동
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        setState(() {
          isLoading = true;
        });
      } else {
        isLoading = true;
      }
    });

    return MaterialApp(
      title: 'MinFlix',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          hintColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: isLoading ? const LoadingScreen() : const Text('1'),
              ),
              Center(
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
              ),
              const Center(
                child: Text('3'),
              ),
              const Center(
                child: Text('4'),
              ),
            ],
          ),
          bottomNavigationBar: const Bottom(),
        ),
      ),
    );
  }
}
