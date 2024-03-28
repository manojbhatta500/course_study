import 'dart:developer';

import 'package:coursestudy/feature/admin/admin_home_page/bloc/admin_home_page_bloc.dart';
import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_list_bloc/course_list_bloc.dart';
import 'package:coursestudy/feature/admin/course_list_screen/ui/screen/course_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/custom_text_form_field.dart';
import '../../../../../util/theme.dart';
import '../../bloc/course_update_bloc/course_update_bloc.dart';
import '../../bloc/course_update_bloc/course_update_event.dart';
import '../../bloc/course_update_bloc/course_update_state.dart';

class CourseUpdateScreen extends StatefulWidget {
  const CourseUpdateScreen(
      {super.key, this.id, this.courseName, this.description});
  final String? id;
  final String? courseName;
  final String? description;

  @override
  State<CourseUpdateScreen> createState() => _CourseUpdateScreenState();
}

class _CourseUpdateScreenState extends State<CourseUpdateScreen> {
  final TextEditingController courseController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    log('init of widget');
    courseController.text = widget.courseName!;
    descriptionController.text = widget.description!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
        color: primaryColor,
        //height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Update Course",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: secondaryColor, fontSize: 32),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: courseController,
                hintText: "Add Course",
                fillColor: primaryColor,
                keyBoardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: descriptionController,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.07, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: primaryColor),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    BlocBuilder<CourseUpdateBloc, CourseUpdateState>(
                      builder: (context, state) {
                        switch (state.runtimeType) {
                          case LoadingCourseUpdateState:
                            const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );

                          case ErrorCourseUpdateState:
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('something is wrong')));

                          case SuccessCourseUpdateState:
                            log('this is success state');
                            context
                                .read<CourseListBloc>()
                                .add(FetchCourseListEvent());
                          // Navigator.pop(context);

                          default:
                            log('this is deault statement in bloc listener');
                        }
                        return ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CourseUpdateBloc>(context)
                                .add(FetchCourseUpdateEvent(
                              widget.id!,
                              courseController.text,
                              descriptionController.text,
                            ));
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.07, 44),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text(
                            "Update",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: primaryColor),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // actions: <Widget>[
      //   // Close the dialog
      //   TextButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     child: const Text("Close"),
      //   ),
      //   // Add additional buttons here if needed
      // ],
    );
  }
}
