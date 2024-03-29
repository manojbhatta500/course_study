import 'package:coursestudy/feature/admin/course_list_screen/ui/screen/course_list_screen.dart';
import 'package:coursestudy/feature/admin/student_list/bloc/student_list_bloc/student_list_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../util/theme.dart';
import '../../course_list_screen/ui/widget/delete_course_widget.dart';
import '../bloc/student_list_bloc/student_list.bloc.dart';
import '../bloc/student_list_bloc/student_list_state.dart';
import '../model/student_list_model.dart';
import 'delete_student_widget.dart';
import 'update_student_widget.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  void initState() {
    context.read<StudentListBloc>().add(FetchStudentListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<StudentListBloc, StudentListState>(
        builder: (context, state) {
          if (state is LoadingStudentListState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorStudentListState) {
            return const Center(child: Text("Error found Student List"));
          } else if (state is SuccessStudentListState) {
            return PaginatedDataTable(
              arrowHeadColor: secondaryColor,
              header: Text(
                'Student List',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: secondaryColor, fontSize: 32),
              ),
              columns: _createColumns(),
              source: StudyCourseDataSou(
                  studentListModel: state.studentListModel, context: context),
              rowsPerPage: 10,
            );
          } else {
            return const Text("error");
          }
        },
      ),
    );
  }
}

List<DataColumn> _createColumns() {
  return [
    const DataColumn(label: Text('ID')),
    const DataColumn(label: Text('Student Name')),
    const DataColumn(label: Text('Course Name')),
    const DataColumn(label: Text('Date of Birth')),
    const DataColumn(label: Text('Started Date')),
    const DataColumn(label: Text('Completed Date')),

    const DataColumn(label: Text('Options')),
    // const DataColumn(label: Text('delete'))
  ];
}

class StudyCourseDataSou extends DataTableSource {
  final List<StudentListModel>? studentListModel;
  final BuildContext context;

  StudyCourseDataSou({this.studentListModel, required this.context});

  @override
  DataRow? getRow(int index) {
    if (index >= studentListModel!.length) {
      return null;
    }
    final userData = studentListModel![index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(userData.id.toString())),
        DataCell(Text(userData.name.toString())),
        DataCell(Text(userData.course.toString())),
        DataCell(Text(
            DateFormat('yyyy-MM-dd').format(DateTime.parse(userData.dOB!)))),
        DataCell(Text(DateFormat('yyyy-MM-dd')
            .format(DateTime.parse(userData.joinedDate!)))),
        DataCell(Text(DateFormat('yyyy-MM-dd')
            .format(DateTime.parse(userData.completedDate!)))),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return UpdateStudentWidget(
                      id: userData.id,
                      name: userData.name,
                      course: userData.course,
                      completeDate: DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(userData.completedDate!)),
                      dateofBirth: DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(userData.dOB!)),
                      joinDate: DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(userData.joinedDate!)),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.update,
                color: Colors.green,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DeleteStudentWidget(
                      id: userData.id,
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ),
            ),
          ],
        )),
      ],
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => studentListModel!.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
