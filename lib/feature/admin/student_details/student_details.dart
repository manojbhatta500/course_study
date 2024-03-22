import 'package:coursestudy/util/my_strings.dart';
import 'package:flutter/material.dart';

import '../../../util/theme.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
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
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff2696f1), Color(0x5b2696f1)],
        )),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                // margin: EdgeInsetsDirectional.symmetric(
                //     horizontal: desktopScreen ? width * 0.3 : width * 0.1,
                //     vertical: desktopScreen ? height * 0.2 : height * 0.1),

                margin: EdgeInsets.only(
                    left: desktopScreen ? width * 0.3 : width * 0.1,
                    right: desktopScreen ? width * 0.3 : width * 0.1,
                    top: desktopScreen ? height * 0.03 : height * 0.1),
                color: secondaryColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                "Siddharth Singh ",
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
                                "Date of Birth: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                "2024 ",
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
                                "Start Date: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                "2024 ",
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
                                "Complete Date ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                "2024 ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: primaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: primaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
