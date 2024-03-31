import 'dart:developer';

import 'package:coursestudy/feature/admin/Auth/bloc/login_bloc/login_event.dart';
import 'package:coursestudy/util/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/custom_text_form_field.dart';
import '../../../../util/theme.dart';
import '../../admin_home_page/screen/admin_home_page.dart';

import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/login_bloc/login_state.dart';
import 'admin_signup.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool desktopScreen = MediaQuery.of(context).size.width > 600;
    bool mobileScreen = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.appName),
      ),
      body: Container(
        height: height,
        width: width,
        color: primaryColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: desktopScreen ? width * 0.3 : width * 0.1,
                  vertical: desktopScreen ? height * 0.2 : height * 0.1),
              color: secondaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: "Email",
                          fillColor: primaryColor,
                          keyBoardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: "Password",
                          fillColor: primaryColor,
                          keyBoardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "You haven't an account? ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: primaryColor),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const AdminSignup()));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: Colors.green),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            switch (state.runtimeType) {
                              case ErrorLoginState:
                                log('error state');
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Login Unsuccess'),
                                  duration: Duration(seconds: 2),
                                ));
                              case LoadingLoginState:
                                const Center(
                                  child: CircularProgressIndicator(),
                                );
                                log('loading state');
                              case SuccessLoginState:
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AdminHomePage()),
                                    (route) => false);

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('successfully Login'),
                                  duration: Duration(seconds: 2),
                                ));
                            }
                          },
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(FetchLoginEvent(
                                    _emailController.text,
                                    _passwordController.text,
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 44),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: secondaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
