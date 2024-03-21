import 'package:coursestudy/feature/user/user_screen/user_details.dart';
import 'package:coursestudy/util/my_strings.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

import '../../../util/custom_button.dart';
import '../../../util/custom_text_form_field.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                margin: EdgeInsetsDirectional.symmetric(
                    horizontal: width * 0.2, vertical: height * 0.2),
                color: secondaryColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "You can search users details",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor),
                        ),
                        const CustomTextFormField(
                          hintText: "Search...",
                          prefixIcon: Icon(
                            Icons.search,
                            color: secondaryColor,
                          ),
                          fillColor: primaryColor,
                          keyBoardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // const CustomButton(
                        //   backgroundColor: primaryColor,
                        //   buttonName: "Check",
                        //   // textColor: Colors.white,
                        // ),

                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const UserDetails()));
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
                            "Check",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
