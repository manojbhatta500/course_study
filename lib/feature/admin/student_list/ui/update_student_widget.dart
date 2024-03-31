import 'dart:developer';

import 'package:coursestudy/feature/admin/admin_home_page/bloc/admin_home_page_bloc.dart';
import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_list_bloc/course_list_bloc.dart';
import 'package:coursestudy/feature/admin/course_list_screen/ui/screen/course_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/custom_text_form_field.dart';
import '../../../../../util/theme.dart';
import '../../../../util/custom_date_picker.dart';
import '../../course_list_screen/model/course_model.dart';
import '../bloc/student_list_bloc/student_list.bloc.dart';
import '../bloc/student_list_bloc/student_list_event.dart';
import '../bloc/update_student_bloc/update_student_bloc.dart';
import '../bloc/update_student_bloc/update_student_event.dart';
import '../bloc/update_student_bloc/update_student_state.dart';

class UpdateStudentWidget extends StatefulWidget {
  const UpdateStudentWidget(
      {super.key,
      this.id,
      this.course,
      this.name,
      this.joinDate,
      this.dateofBirth,
      this.completeDate});
  final String? id;
  final String? course;
  final String? name;
  final String? joinDate;
  final String? dateofBirth;
  final String? completeDate;

  @override
  State<UpdateStudentWidget> createState() => _UpdateStudentWidgetState();
}

class _UpdateStudentWidgetState extends State<UpdateStudentWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _startedDateController = TextEditingController();
  final TextEditingController _completedDateController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final String _selectedItem = 'Choose Course';

  @override
  void dispose() {
    _nameController.dispose();

    _courseController.dispose();
    _startedDateController.dispose();
    _dateOfBirthController.dispose();
    _completedDateController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    context.read<CourseListBloc>().add(FetchCourseListEvent());
    log('init of widget');
    // _courseController.text = widget.course != null ? "" : widget.course!;
    _nameController.text = widget.name!;
    _startedDateController.text = widget.joinDate!;
    _completedDateController.text = widget.completeDate!;
    _dateOfBirthController.text = widget.dateofBirth!;
    super.initState();
  }

  CourseModel? _courseModel;
  String? courseId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
        color: primaryColor,
        //height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Update student",
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
              BlocBuilder<CourseListBloc, CourseListState>(
                builder: (context, state) {
                  if (state is CourseListLoadingState) {
                    return const Text("Loading...");
                  } else if (state is CourseListFailedState) {
                    return const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "   First Create Course",
                      ),
                    );
                  } else if (state is CourseListSuccessState) {
                    return DropdownButtonFormField<CourseModel>(
                      hint: const Text(
                        'Choose Course',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      //value: null,
                      value: _courseModel,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _courseModel = newValue!;
                          courseId = _courseModel!.id;

                          // state.submeterlist[0] = newValue!;
                          //dropdownValue = newValue!;
                        });
                        // BlocProvider.of<SubMeterBloc>(context)
                        //     .add(FetchSubMeterEvent());
                      },
                      items: state.courseList.map((value) {
                        return DropdownMenuItem<CourseModel>(
                          value: value,
                          child: Text(
                            // value.toString(),
                            value.name!,
                            //_subMeterModel!.name!,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        );
                      }).toList(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),

              // **************************************************************************

              const SizedBox(
                height: 20,
              ),
              CustomDatePicker(
                dateController: _dateOfBirthController,
                hintText: "Select Date of Birth",
                onDateSelected: (value) {
                  _dateOfBirthController.text =
                      "${value.year.toString()}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}";
                },
              ),

              const SizedBox(
                height: 20,
              ),
              CustomDatePicker(
                dateController: _startedDateController,
                hintText: "Select Start Date",
                onDateSelected: (value) {
                  _startedDateController.text =
                      "${value.year.toString()}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}";
                },
              ),

              const SizedBox(
                height: 20,
              ),
              CustomDatePicker(
                dateController: _completedDateController,
                hintText: "Select Completed Date",
                onDateSelected: (value) {
                  _completedDateController.text =
                      "${value.year.toString()}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}";
                },
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
                    BlocBuilder<UpdatetudentBloc, UpdateStudentState>(
                      builder: (context, state) {
                        switch (state.runtimeType) {
                          case LoadingUpdateStudentState:
                            const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );

                          case ErrorUpdateStudentState:
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //         backgroundColor: Colors.red,
                          //         content: Text('something is wrong')));

                          case SuccessUpdateStudentState:
                            log('this is success state');
                            // context
                            //     .read<StudentListBloc>()
                            //     .add(FetchStudentListEvent());
                            // Navigator.pop(context);

                            BlocProvider.of<StudentListBloc>(context)
                                .add(FetchStudentListEvent());

                          default:
                            log('this is deault statement in bloc listener');
                        }
                        return ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<UpdatetudentBloc>(context)
                                .add(FetchUpdateStudentEvent(
                              widget.id!,
                              courseId!,
                              // _courseController.text,
                              _nameController.text,
                              _dateOfBirthController.text,
                              _completedDateController.text,
                              _startedDateController.text,
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
