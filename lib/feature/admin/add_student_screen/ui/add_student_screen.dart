import 'dart:developer';

import 'package:coursestudy/feature/admin/add_student_screen/bloc/add_student_event.dart';
import 'package:coursestudy/util/custom_date_picker.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/custom_text_form_field.dart';

import '../../course_list_screen/course_list_bloc/course_list_bloc.dart';
import '../../course_list_screen/model/course_model.dart';
import '../bloc/add_student_bloc.dart';
import '../bloc/add_student_state.dart';

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

  CourseModel? _courseModel;
  String? courseId;

  @override
  void initState() {
    context.read<CourseListBloc>().add(FetchCourseListEvent());
    super.initState();
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
            BlocListener<AddStudentBloc, AddStudentState>(
              listener: (context, state) {
                switch (state.runtimeType) {
                  case ErrorAddStudentState:
                    log('error state');
                  case LoadingAddStudentState:
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                    log('loading state');
                  case SuccessAddStudentState:
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('successfully Added Student'),
                      duration: Duration(seconds: 2),
                    ));
                }
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    String dob = DateTime.parse(_dateOfBirthController.text)
                        .toIso8601String();
                    log("${dob}date and time");
                    context.read<AddStudentBloc>().add(FetchAddStudentEvent(
                          courseId!,
                          DateTime.parse(_dateOfBirthController.text)
                              .toIso8601String(),
                          DateTime.parse(_completedDateController.text)
                              .toIso8601String(),
                          DateTime.parse(_StartedDateController.text)
                              .toIso8601String(),
                          _nameController.text,
                        ));
                    _dateOfBirthController.clear();
                    _nameController.clear();
                    _StartedDateController.clear();
                    _completedDateController.clear();
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
