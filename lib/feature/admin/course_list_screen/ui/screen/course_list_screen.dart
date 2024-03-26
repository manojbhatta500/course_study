import 'package:coursestudy/feature/admin/course_list_screen/course_list_bloc/course_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/theme.dart';
import '../../model/course_model.dart';
import '../widget/table_widget.dart';

final List<UserData> userList = [
  UserData(
      des: "fsdkljfa", id: 1, isDelete: true, isUpdate: true, name: "Flutter"),
  UserData(
      des: "ljksdfklaj", id: 2, isDelete: false, isUpdate: true, name: "Dart"),
  UserData(
      des: "fsdkljfa", id: 3, isDelete: true, isUpdate: false, name: "React")
];

class TableWithHeadings extends StatelessWidget {
  const TableWithHeadings({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CourseListBloc>().add(FetchCourseListEvent());
    return SingleChildScrollView(
      child: BlocBuilder<CourseListBloc, CourseListState>(
        builder: (context, state) {
          switch (state) {
            case CourseListLoadingState():
              return Center(
                child: CircularProgressIndicator(),
              );
            case CourseListFailedState():
              return Center(
                child: Text("Error"),
              );
            case CourseListSuccessState():
              return PaginatedDataTable(
                header: Text(
                  'Course List',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: secondaryColor, fontSize: 32),
                ),
                columns: _createColumns(),
                source: StudyCourseDataSource(state.courseList),
                rowsPerPage: 10,
              );
            default:
              return Text('Hello');
          }
        },
      ),
    );
  }
}

/*PaginatedDataTable(
header: Text(
'Course List',
style: Theme.of(context)
    .textTheme
    .bodyLarge!
    .copyWith(color: secondaryColor, fontSize: 32),
),
columns: _createColumns(),
source: StudyCourseDataSource(state.),
rowsPerPage: 10,
);*/

class UserData {
  final int id;
  final String name;
  final String des;
  final bool isDelete;
  final bool isUpdate;

  UserData(
      {required this.des,
      required this.id,
      required this.isDelete,
      required this.isUpdate,
      required this.name});
}

DataTable _createDataTable() {
  return DataTable(
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
    const DataColumn(
        label: Text(
      'Course Name',
    )),

    const DataColumn(label: Text('Options')),
    // const DataColumn(label: Text('delete'))
  ];
}

List<DataRow> _createRows() {
  return userList
      .map((e) => DataRow(cells: [
            DataCell(Text(e.id.toString())),
            DataCell(Text(e.name)),

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
                // Text(e.isUpdate.toString()),
                // Text(e.isDelete.toString())
              ],
            )),

            // DataCell(Text(e.isUpdate.toString())),
            // DataCell(Text(e.isDelete.toString())),
          ]))
      .toList();
}

class StudyCourseDataSource extends DataTableSource {
  List<CourseModel>? courseModel;

  StudyCourseDataSource(this.courseModel);

  @override
  DataRow? getRow(int index) {
    if (index >= courseModel!.length) {
      return null;
    }
    final userData = courseModel![index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(userData.id.toString())),
        DataCell(Text(userData.name!)),
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
