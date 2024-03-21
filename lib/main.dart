import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

import 'feature/user/user_screen/user_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserScreen(),
      theme: lightTheme(BuildContext, context),
    );
  }
}

