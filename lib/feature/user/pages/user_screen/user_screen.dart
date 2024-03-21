import 'package:coursestudy/feature/admin/ui/admin_login.dart';
import 'package:coursestudy/feature/user/pages/user_screen/user_details.dart';
import 'package:coursestudy/feature/user/widgets/user_screen_login.dart';
import 'package:coursestudy/util/my_strings.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

import '../../../../util/custom_button.dart';
import '../../../../util/custom_text_form_field.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool desktopScreen = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.appName),
      ),
      floatingActionButton: desktopScreen
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminLoginScreen()));
              },
              child: Text('Admin'))
          : null,
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff2696f1), Color(0x5b2696f1)],
        )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserScreenLogin(width: width, height: height),
            ],
          ),
        ),
      ),
    );
  }
}
