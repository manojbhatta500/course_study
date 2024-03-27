import 'dart:convert';

import 'package:coursestudy/util/apis.dart';
import 'package:http/http.dart';

import '../../../../util/http_manager.dart';

class CourseUpdateRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<Response> updateCourse(
      String id, String course, String description) async {
    Response response = await manager.hitApi(
      requestType: RequestEnum.patch,
      apiUrl: "${Apis.updateCourseApi}/$id",
      prameter: jsonEncode({
        "name": course,
        "description": description,
      }),
    );

    try {
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(" this is repo else");
      }
    } catch (e) {
      throw Exception(" ${e.toString()}   ***   this is repo catch");
    }
  }
}
