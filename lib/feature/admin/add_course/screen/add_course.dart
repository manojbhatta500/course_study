import 'dart:developer';

import 'package:coursestudy/feature/admin/add_course/bloc/course_add_bloc.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocListener<CourseAddBloc, CourseAddState>(
              listener: (context, state) {
                switch (state.runtimeType) {
                  case AddCourseSuccess:
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('successfully added')));
                    _courseController.clear();
                    _descriptionController.clear();

                  case AddCourseFailed:
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('something is wrong')));

                  default:
                    log('this is deault statement in bloc listener');
                }
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CourseAddBloc>(context).add(
                        UserAddCourseEvent(
                            courseName: _courseController.text,
                            courseDisc: _descriptionController.text));
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
            ),
          ],
        ),
      ),
    );
  }
}
