import 'dart:developer';

import 'package:coursestudy/util/custom_date_picker.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../util/custom_text_form_field.dart';
import '../../Auth/admin_signup.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _StartedDateController = TextEditingController();
  final TextEditingController _completedDateController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final String _selectedItem = 'Choose Course';

  @override
  void dispose() {
    _nameController.dispose();

    _courseController.dispose();
    _StartedDateController.dispose();
    _dateOfBirthController.dispose();
    _completedDateController.dispose();

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
              "Add Student",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: secondaryColor, fontSize: 32),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              controller: _nameController,
              hintText: "Student Name",
              fillColor: primaryColor,
              keyBoardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
// ******************************************************
            // DropdownButton<String>(

            //   value: _selectedItem,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       _selectedItem = newValue!;
            //     });
            //   },
            //   items: <String>['Flutter', 'Firebase', 'React ', 'Node js']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),

            // **************************************************************************

            CustomTextFormField(
              controller: _courseController,
              hintText: "Course dropdown",
              fillColor: primaryColor,
              keyBoardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: _dateOfBirthController,
              hintText: "Date Of Birth",
              fillColor: primaryColor,
              keyBoardType: TextInputType.text,
              sufixIcon: CustomDatePicker(
                onDateSelected: (value) {
                  _dateOfBirthController.text = value.toString();
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: _StartedDateController,
              hintText: "started Date",
              fillColor: primaryColor,
              keyBoardType: TextInputType.text,
              sufixIcon: CustomDatePicker(
                onDateSelected: (value) {
                  _StartedDateController.text = value.toString();
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: _completedDateController,
              hintText: "Completed Date",
              fillColor: primaryColor,
              keyBoardType: TextInputType.text,
              sufixIcon: CustomDatePicker(
                onDateSelected: (value) {
                  _completedDateController.text = value.toString();
                },
              ),
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
