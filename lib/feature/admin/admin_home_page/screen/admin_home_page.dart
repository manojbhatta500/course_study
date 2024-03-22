import 'package:coursestudy/feature/admin/Auth/admin_login.dart';
import 'package:coursestudy/feature/admin/Auth/admin_signup.dart';
import 'package:coursestudy/feature/admin/admin_home_page/bloc/admin_home_page_bloc.dart';
import 'package:coursestudy/feature/admin/admin_home_page/screen/nav_button.dart';
import 'package:coursestudy/feature/admin/post_form/screens/post_form.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              child: Column(
                children: [
                  NavButton(
                    title: 'Homepage',
                    icondata: Icons.home,
                    onpressed: () {
                      BlocProvider.of<AdminHomePageBloc>(context)
                          .add(const AdminClickEvent(id: 0));
                    },
                  ),
                  NavButton(
                    title: 'Homepage',
                    icondata: Icons.home,
                    onpressed: () {
                      BlocProvider.of<AdminHomePageBloc>(context)
                          .add(const AdminClickEvent(id: 1));
                    },
                  ),
                  NavButton(
                    title: 'Homepage',
                    icondata: Icons.home,
                    onpressed: () {
                      BlocProvider.of<AdminHomePageBloc>(context)
                          .add(const AdminClickEvent(id: 2));
                    },
                  ),
                  NavButton(
                    title: 'Homepage',
                    icondata: Icons.home,
                    onpressed: () {
                      BlocProvider.of<AdminHomePageBloc>(context)
                          .add(const AdminClickEvent(id: 3));
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<AdminHomePageBloc, AdminHomePageState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case Page1:
                      return const AdminLogin();

                    case Page2:
                      return const AdminSignup();

                    case Page3:
                      return const PostForm();

                    case Page4:
                      return const AdminLogin();

                    default:
                      print('this is invalid');
                      return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


//  return Container(
//                     color: Colors.blue,
//                   );