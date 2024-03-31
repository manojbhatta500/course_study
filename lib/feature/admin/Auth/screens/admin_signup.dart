import 'dart:developer';

import 'package:coursestudy/feature/admin/Auth/bloc/signUp_bloc/signup_event.dart';
import 'package:coursestudy/feature/admin/Auth/screens/admin_login.dart';
import 'package:coursestudy/util/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/custom_text_form_field.dart';
import '../../../../util/theme.dart';
import '../bloc/signUp_bloc/signup_bloc.dart';
import '../bloc/signUp_bloc/signup_state.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({super.key});

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();

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
                          controller: _fullNameController,
                          hintText: "Name",
                          fillColor: primaryColor,
                          keyBoardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                              "You have already an account? ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: primaryColor),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const AdminLogin()));
                                },
                                child: Text(
                                  "Login",
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
                        BlocListener<SignUpBloc, SignUpState>(
                          listener: (context, state) {
                            switch (state.runtimeType) {
                              case ErrorSignUpState:
                                log('error state');
                              case LoadingSignUpState:
                                const Center(
                                  child: CircularProgressIndicator(),
                                );
                                log('loading state');
                              case SuccessSignUpState:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminLogin()));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('successfully SignUp'),
                                  duration: Duration(seconds: 2),
                                ));
                            }
                          },
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<SignUpBloc>().add(FetchSignUpEvent(
                                    _emailController.text,
                                    _passwordController.text,
                                    _fullNameController.text,
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
                              "Sign Up",
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
