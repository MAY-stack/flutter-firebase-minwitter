import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minwitter/screen/comment_screen.dart';
import 'package:minwitter/screen/login_screen.dart';
import 'package:minwitter/screen/main_screen.dart';
import 'package:minwitter/screen/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:minwitter/firebase_options.dart';
import 'package:minwitter/screen/protected_screen.dart';
import 'package:minwitter/screen/signup_screen.dart';
import 'package:minwitter/screen/temp_main_screen.dart';
import 'package:minwitter/widget/github_button_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool islogedIn = false;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        islogedIn = false;
      } else {
        print('User is signed in!');
        islogedIn = true;
      }
    });

    return MaterialApp(
      title: 'Minwitter',
      initialRoute: '/profile',
      routes: {
        '/': (context) => const ProtectedScreen(),
        '/comments': (context) => const CommentScreen(),
        '/temp': (context) => const TempMainScreen(),
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/signup': (context) => const SignupScreen(),
      },
    );
  }
}
