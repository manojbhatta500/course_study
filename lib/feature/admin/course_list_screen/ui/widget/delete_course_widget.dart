import 'dart:developer';

import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_list_bloc/course_list_bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/theme.dart';

import '../../bloc/delete_course_bloc/delete_course_bloc.dart';
import '../../bloc/delete_course_bloc/delete_course_event.dart';
import '../../bloc/delete_course_bloc/delete_course_state.dart';

class DeleteCourseWidget extends StatefulWidget {
  const DeleteCourseWidget({
    super.key,
    this.id,
  });
  final String? id;

  @override
  State<DeleteCourseWidget> createState() => _DeleteCourseWidgetState();
}

class _DeleteCourseWidgetState extends State<DeleteCourseWidget> {
  final TextEditingController courseController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   log('init of widget');
  //   courseController.text = widget.courseName!;
  //   descriptionController.text = widget.description!;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
        color: primaryColor,
        //height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are You Sure want to delete?",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: secondaryColor, fontSize: 32),
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
                  BlocBuilder<DeleteCourseBloc, DeleteCourseState>(
                    builder: (context, state) {
                      switch (state.runtimeType) {
                        case LoadingDeleteCourseState:
                          const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );

                        case ErrorDeleteCourseState:
                          log("this is ui delete student error");
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //         backgroundColor: Colors.red,
                        //         content: Text('something is wrong')));

                        case SuccessDeleteCourseState:
                          log('this is success state');
                          // context
                          //     .read<CourseListBloc>()
                          //     .add(FetchCourseListEvent());
                          // Navigator.pop(context);

                          BlocProvider.of<CourseListBloc>(context)
                              .add(FetchCourseListEvent());

                        default:
                          log('this is deault statement in bloc listener');
                      }
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<DeleteCourseBloc>(context)
                              .add(FetchDeleteCourseEvent(
                            widget.id!,
                          ));
                          Navigator.pop(
                              context,);
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
                          "Delete",
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
    );
  }
}
