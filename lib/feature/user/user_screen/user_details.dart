import 'package:coursestudy/feature/user/model/user_model.dart';
import 'package:coursestudy/util/my_strings.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  final UserModel? userModel;
  final String? id;
  const UserDetails({super.key, this.userModel, this.id});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool desktopScreen = MediaQuery.of(context).size.width > 600;
    bool mobileScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.appName),
      ),
      body: Container(
        height: height,
        width: width,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: desktopScreen ? width * 0.3 : width * 0.1,
                  vertical: desktopScreen ? height * 0.2 : height * 0.1),
              color: secondaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Row(
                        children: [
                          Text(
                            "Name: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: primaryColor),
                          ),
                          Text(
                            widget.userModel!.name!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Date of Birth: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor),
                        ),
                        Text(
                          widget.userModel!.dOB!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Course Enroll: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor),
                        ),
                        Text(
                          "Flutter",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Joined Date: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor),
                        ),
                        Text(
                          widget.userModel!.joinedDate!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Completed Date ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor),
                        ),
                        Text(
                          widget.userModel!.completedDate!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
