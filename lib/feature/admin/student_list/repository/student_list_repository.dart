import 'dart:convert';
import 'dart:developer';

import 'package:coursestudy/feature/admin/student_list/model/student_list_model.dart';
import 'package:http/http.dart' as http;

import '../../../../util/apis.dart';

class StudentListRepository {
  StudentListModel studentListModel = StudentListModel();

  Future<List<StudentListModel>> studentList() async {
    final response = await http.get(Uri.parse(Apis.getStudentApi));
    log(response.toString());
    try {
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        final List<StudentListModel> model =
            data.map((e) => StudentListModel.fromJson(e)).toList();
        return model;
      } else {
        throw Exception("fail to student list else");
      }
    } catch (e) {
      throw Exception("fail to search student catch");
    }
  }
}
