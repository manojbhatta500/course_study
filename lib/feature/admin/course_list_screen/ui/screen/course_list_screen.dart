import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_list_bloc/course_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/theme.dart';
import '../../model/course_model.dart';
import '../widget/table_widget.dart';

final List<CourseModel> courseList = [];

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
  int get rowCount => courseModel!.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
