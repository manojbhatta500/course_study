import 'package:coursestudy/feature/admin/ui/admin_login.dart';
import 'package:coursestudy/util/size.dart';
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
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
      theme: lightTheme(context),
    );
  }
}
