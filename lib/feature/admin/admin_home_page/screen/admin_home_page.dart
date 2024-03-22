import 'package:coursestudy/feature/admin/admin_home_page/screen/nav_button.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Homepage'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc_outlined)),
        ],
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          children: [
            Container(
              height: height,
              width: 0.2 * width,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  border: Border.all(color: Colors.white, width: 1)),
              child: const Column(
                children: [
                  NavButton(title: 'Homepage', icondata: Icons.home),
                  NavButton(title: 'Homepage', icondata: Icons.home),
                  NavButton(title: 'Homepage', icondata: Icons.home),
                  NavButton(title: 'Homepage', icondata: Icons.home),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
