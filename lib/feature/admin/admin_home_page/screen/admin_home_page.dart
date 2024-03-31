import 'package:coursestudy/feature/admin/Auth/screens/admin_login.dart';
import 'package:coursestudy/feature/admin/Auth/screens/admin_signup.dart';
import 'package:coursestudy/feature/admin/admin_home_page/bloc/admin_home_page_bloc.dart';
import 'package:coursestudy/feature/admin/admin_home_page/screen/nav_button.dart';
import 'package:coursestudy/feature/admin/post_form/screens/post_form.dart';
import 'package:coursestudy/util/my_strings.dart';
import 'package:coursestudy/util/theme.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add_course/screen/add_course.dart';
import '../../add_student_screen/ui/add_student_screen.dart';
import '../../course_list_screen/ui/screen/course_list_screen.dart';
import '../../student_list/ui/student_list_screen.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text(MyStrings.appName),
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
              width: 0.15 * width,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  border: Border.all(color: Colors.white, width: 1)),
              child: Column(
                children: [
                  NavButton(
                    title: 'Add Course',
                    icondata: Icons.home,
                    onpressed: () {
                      BlocProvider.of<AdminHomePageBloc>(context)
                          .add(const AdminClickEvent(id: 0));
                    },
                  ),
                  NavButton(
                    title: 'Course List',
                    icondata: Icons.home,
                    onpressed: () {
                      BlocProvider.of<AdminHomePageBloc>(context)
                          .add(const AdminClickEvent(id: 1));
                    },
                  ),
                  NavButton(
                    title: 'Add Student',
                    icondata: Icons.home,
                    onpressed: () {
                      BlocProvider.of<AdminHomePageBloc>(context)
                          .add(const AdminClickEvent(id: 2));
                    },
                  ),
                  NavButton(
                    title: 'Student List',
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
                      return const AddCourse();

                    case Page2:
                      return const TableWithHeadings();

                    case Page3:
                      return const AddStudentScreen();

                    case Page4:
                      return const StudentListScreen();

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