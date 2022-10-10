import 'package:flutter/material.dart';
import 'package:skripsi/ui/pages/hasil_screen.dart';
import 'package:skripsi/ui/pages/theory_screen.dart';
import 'package:skripsi/ui/pages/about_screen.dart';
import 'package:skripsi/ui/pages/category_screen.dart';
import 'package:skripsi/ui/pages/home_screen.dart';

import 'package:skripsi/ui/pages/coba_screen.dart';
import 'package:skripsi/ui/pages/login_screen.dart';
import 'package:skripsi/ui/pages/practice_screen.dart';
import 'package:skripsi/ui/pages/quiz_screen.dart';
import 'package:skripsi/ui/pages/regist_screen.dart';
import 'package:skripsi/ui/pages/splash_screen.dart';
import 'package:skripsi/ui/pages/test_file.dart';
import 'package:skripsi/ui/pages/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/loginscreen': (context) => const LoginScreen(),
        '/v': (context) => const CobaScreen(),
        '/f': (context) => const RegistScreen(),
        '/homescreen': (context) => HomeScreen(),
        '/categoryscreen': (context) => const CategoryScreen(),
        '/aboutscreen': (context) => const AboutScreen(),
        '/theoryscreen': (context) => TheoryScreen(),
        '/praticescreen': (context) => PraticeScreen(),
        '/quizscreen': (context) => const QuizScreen(),
        '/hasilscreen': (context) => const HasilScreen(),
        '/b': (context) => const TestPage(),
        '/aa': (context) => const TestFile(),
      },
    );
  }
}
