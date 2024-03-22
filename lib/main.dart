import 'package:coursestudy/feature/admin/admin_home_page/bloc/admin_home_page_bloc.dart';
import 'package:coursestudy/feature/admin/ui/admin_login.dart';
import 'package:coursestudy/feature/user/bloc/user_bloc.dart';
import 'package:coursestudy/util/size.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/user/user_screen/user_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => AdminHomePageBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const UserScreen(),
        theme: lightTheme(context),
      ),
    );
  }
}
