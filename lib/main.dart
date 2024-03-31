import 'package:coursestudy/feature/admin/add_course/bloc/course_add_bloc.dart';
import 'package:coursestudy/feature/admin/add_student_screen/bloc/add_student_bloc.dart';

import 'package:coursestudy/feature/admin/admin_home_page/bloc/admin_home_page_bloc.dart';
import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_list_bloc/course_list_bloc.dart';
import 'package:coursestudy/feature/admin/ui/admin_login.dart';
import 'package:coursestudy/feature/user/bloc/user_bloc.dart';
import 'package:coursestudy/util/size.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/admin/Auth/bloc/login_bloc/login_bloc.dart';
import 'feature/admin/Auth/bloc/signUp_bloc/signup_bloc.dart';
import 'feature/admin/course_list_screen/bloc/course_update_bloc/course_update_bloc.dart';
import 'feature/admin/course_list_screen/bloc/delete_course_bloc/delete_course_bloc.dart';
import 'feature/admin/student_list/bloc/delete_student_bloc/delete_student_bloc.dart';
import 'feature/admin/student_list/bloc/student_list_bloc/student_list.bloc.dart';
import 'feature/admin/student_list/bloc/update_student_bloc/update_student_bloc.dart';
import 'feature/user/user_screen/user_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => AdminHomePageBloc(),
        ),
        BlocProvider(create: (context) => StudentListBloc()),
        BlocProvider(create: (context) => CourseAddBloc()),
        BlocProvider(create: (context) => AddStudentBloc()),
        BlocProvider(create: (context) => CourseUpdateBloc()),
        BlocProvider(create: (context) => CourseListBloc()),
        BlocProvider(create: (context) => DeleteCourseBloc()),
        BlocProvider(create: (context) => UpdatetudentBloc()),
        BlocProvider(create: (context) => DeleteStudentBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: Container(
        constraints: BoxConstraints(
          minWidth: width * 0.8,
          maxWidth: double.infinity,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const UserScreen(),
          theme: lightTheme(context),
        ),
      ),
    );
  }
}
