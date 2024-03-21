import 'package:coursestudy/feature/admin/widgets/admin_login_card.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool desktopScreen = MediaQuery.of(context).size.width > 600;
    bool mobileScreen = MediaQuery.of(context).size.width < 600;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin',
          style: TextStyle(color: secondaryColor),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Center(
          child: desktopScreen
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.3),
                  child: AdminLoginCard(),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: AdminLoginCard(),
                )),
    );
  }
}
