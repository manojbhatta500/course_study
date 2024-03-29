import 'dart:developer';

import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_list_bloc/course_list_bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/theme.dart';
import '../bloc/delete_student_bloc/delete_student_bloc.dart';
import '../bloc/delete_student_bloc/delete_student_event.dart';
import '../bloc/delete_student_bloc/delete_student_state.dart';
import '../bloc/student_list_bloc/student_list.bloc.dart';
import '../bloc/student_list_bloc/student_list_event.dart';

class DeleteStudentWidget extends StatefulWidget {
  const DeleteStudentWidget({
    super.key,
    this.id,
  });
  final String? id;

  @override
  State<DeleteStudentWidget> createState() => _DeleteStudentWidgetState();
}

class _DeleteStudentWidgetState extends State<DeleteStudentWidget> {
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
              "Are You Sure!",
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
                  BlocBuilder<DeleteStudentBloc, DeleteStudentState>(
                    builder: (context, state) {
                      switch (state.runtimeType) {
                        case LoadingDeleteStudentState:
                          const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );

                        case ErrorDeleteStudentState:
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //         backgroundColor: Colors.red,
                        //         content: Text('something is wrong')));

                        case SuccessDeleteStudentState:
                          log('this is success state');
                          // context
                          //     .read<StudentListBloc>()
                          //     .add(FetchStudentListEvent());
                          // Navigator.pop(context);

                          BlocProvider.of<StudentListBloc>(context)
                              .add(FetchStudentListEvent());

                        default:
                          log('this is deault statement in bloc builder');
                      }
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<DeleteStudentBloc>(context)
                              .add(FetchDeleteStudentEvent(
                            widget.id!,
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