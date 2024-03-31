import 'package:coursestudy/feature/user/user_screen/user_details.dart';
import 'package:coursestudy/feature/user/widgets/user_screen_login.dart';
import 'package:coursestudy/util/my_strings.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

import '../../../util/custom_button.dart';
import '../../../util/custom_text_form_field.dart';
import '../../admin/Auth/screens/admin_login.dart';

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
    bool isdesktop = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.appName),
      ),
      floatingActionButton: isdesktop
          ? FloatingActionButton(
              backgroundColor: secondaryColor,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AdminLogin()));
              },
              child: const Icon(
                Icons.admin_panel_settings_outlined,
                color: primaryColor,
              ),
            )
          : null,
      body: Container(
        height: height,
        width: width,
        color: primaryColor,
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
