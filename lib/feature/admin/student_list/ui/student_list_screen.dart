import 'package:coursestudy/feature/admin/course_list_screen/ui/screen/course_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../util/theme.dart';

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

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: const Text('Tasks'),
        columns: _createColumns(),
        source: StudyCourseDataSou(),
        rowsPerPage: 10,
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
  @override
  DataRow? getRow(int index) {
    if (index >= userList.length) {
      return null;
    }
    final userData = userList[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(userData.id.toString())),
        DataCell(Text(userData.name)),
        DataCell(Text(userData.courseName)),
        DataCell(Text(userData.dateOfBirth)),
        DataCell(Text(userData.startedDate)),
        DataCell(Text(userData.completedDate)),
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
