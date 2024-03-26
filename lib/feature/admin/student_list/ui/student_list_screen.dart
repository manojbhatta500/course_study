import 'package:coursestudy/feature/admin/course_list_screen/ui/screen/course_list_screen.dart';
import 'package:coursestudy/feature/admin/student_list/bloc/student_list_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/theme.dart';
import '../bloc/student_list.bloc.dart';
import '../bloc/student_list_state.dart';
import '../model/student_list_model.dart';

final List<UserData> userList = [
  UserData(
      id: 1,
      isDelete: true,
      isUpdate: true,
      name: "Flutter",
      courseName: 'Flutter',
      startedDate: '2024-08-09',
      completedDate: '2025-08-08',
      dateOfBirth: '2000-09-09'),
  UserData(
      id: 2,
      isDelete: false,
      isUpdate: true,
      name: "Dart",
      courseName: 'Flutter',
      startedDate: '2024-08-09',
      completedDate: '2025-08-08',
      dateOfBirth: '2000-09-09'),
  UserData(
      id: 3,
      isDelete: true,
      isUpdate: false,
      name: "React",
      courseName: 'Flutter',
      startedDate: '2024-08-09',
      completedDate: '2025-08-08',
      dateOfBirth: '2000-09-09')
];

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
              source: StudyCourseDataSou(),
              rowsPerPage: 10,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String courseName;
  final String dateOfBirth;
  final String startedDate;
  final String completedDate;
  final bool isDelete;
  final bool isUpdate;
  UserData(
      {required this.id,
      required this.isDelete,
      required this.isUpdate,
      required this.name,
      required this.completedDate,
      required this.courseName,
      required this.dateOfBirth,
      required this.startedDate});
}

DataTable _createDataTable() {
  return DataTable(
      columnSpacing: BouncingScrollSimulation.maxSpringTransferVelocity * 0.02,
      headingTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      dataTextStyle: const TextStyle(
        fontSize: 16,
      ),
      columns: _createColumns(),
      rows: _createRows());
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

List<DataRow> _createRows() {
  return userList
      .map((e) => DataRow(cells: [
            DataCell(Text(e.id.toString())),
            DataCell(Text(e.name)),
            DataCell(Text(e.courseName)),
            DataCell(Text(e.dateOfBirth)),
            DataCell(Text(e.startedDate)),
            DataCell(Text(e.completedDate)),
            DataCell(Row(
              children: [
                IconButton(
                  onPressed: () {},
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 25,
                  ),
                ),
              ],
            )),
          ]))
      .toList();
}

class StudyCourseDataSou extends DataTableSource {
  final List<StudentListModel>? studentListModel;

  StudyCourseDataSou({this.studentListModel});

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
        DataCell(Text(userData.name!)),
        DataCell(Text(userData.course.toString())),
        DataCell(Text(userData.dOB.toString())),
        DataCell(Text(userData.joinedDate.toString())),
        DataCell(Text(userData.completedDate.toString())),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {},
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
              onPressed: () {},
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
  int get rowCount => userList.length;
  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
