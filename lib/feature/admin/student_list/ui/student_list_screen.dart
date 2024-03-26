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
              source:
                  StudyCourseDataSou(studentListModel: state.studentListModel),
              rowsPerPage: 10,
            );
          } else {
            return Text("error");
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
  int get rowCount => studentListModel!.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
