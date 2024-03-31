import 'package:coursestudy/feature/admin/Auth/screens/admin_login.dart';
import 'package:coursestudy/util/my_strings.dart';
import 'package:flutter/material.dart';

import '../../../../util/custom_date_picker.dart';
import '../../../../util/custom_text_form_field.dart';
import '../../../../util/theme.dart';
import '../../student_details/student_details.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _completeDateController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();

  //late DateTime selectedDate;

  @override
  void dispose() {
    _studentNameController.dispose();
    _courseController.dispose();
    _dateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool desktopScreen = MediaQuery.of(context).size.width > 600;
    bool mobileScreen = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(MyStrings.appName),
      // ),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff2696f1), Color(0x5b2696f1)],
        )),
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
                          controller: _studentNameController,
                          hintText: "Student Name",
                          fillColor: primaryColor,
                          keyBoardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          controller: _courseController,
                          hintText: "Course Name",
                          fillColor: primaryColor,
                          keyBoardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          controller: _dateController,
                          hintText: "Date Of Birth",
                          fillColor: primaryColor,
                          keyBoardType: TextInputType.text,
                          sufixIcon: CustomDatePicker(
                            onDateSelected: (DateTime dataTime) {
                              _dateController.text = dataTime.toString();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          controller: _startDateController,
                          hintText: "Started Date",
                          fillColor: primaryColor,
                          keyBoardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          controller: _completeDateController,
                          hintText: "Completed Date",
                          fillColor: primaryColor,
                          keyBoardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const StudentDetails()));
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
                            "Post",
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
            ),
          ],
        ),
      ),
    );
  }
}
