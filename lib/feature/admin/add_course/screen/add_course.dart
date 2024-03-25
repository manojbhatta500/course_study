import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../util/custom_text_form_field.dart';
import '../../Auth/admin_signup.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _courseController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
      color: primaryColor,
      height: height,
      width: width,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add Course",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: secondaryColor, fontSize: 32),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              controller: _courseController,
              hintText: "Add Course",
              fillColor: primaryColor,
              keyBoardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: _descriptionController,
              hintText: "description",
              fillColor: primaryColor,
              keyBoardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const AdminHomePage()),
                  //     (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.07, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
