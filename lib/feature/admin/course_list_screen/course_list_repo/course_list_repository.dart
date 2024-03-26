import 'dart:convert';
import 'dart:developer';

import 'package:coursestudy/util/http_manager.dart';
import 'package:http/http.dart';

import '../../../../util/apis.dart';
import '../model/course_model.dart';

class CourseListRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<List<CourseModel>> fetchRepoFromServer() async {
    try {
      Response respo = await manager.hitApi(
          requestType: RequestEnum.get, apiUrl: Apis.getCourseListApi);
      if (respo.statusCode == 200) {
        final List data = jsonDecode(respo.body);
        List<CourseModel> courseList =
            data.map((e) => CourseModel.fromJson(e)).toList();
        return courseList;
      } else {
        log('this is false');
        throw Exception("Failed to load");
      }
    } catch (e) {
      log('this is repo catch');
      throw Exception(e);
    }
  }
}
