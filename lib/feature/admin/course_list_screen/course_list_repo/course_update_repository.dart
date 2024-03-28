import 'dart:convert';
import 'dart:developer';

import 'package:coursestudy/util/apis.dart';
import 'package:http/http.dart';

import '../../../../util/http_manager.dart';

class CourseUpdateRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<bool> updateCourse(
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
        log('this is respo checker 200');

        log('this is respo checker');
        log(response.body);

        return true;
      } else {
        log('this is respo checker  not 200');

        log('this is respo checker');

        return false;
      }
    } catch (e) {
      throw Exception(" this is catch exceptions ***   this is repo catch");
    }
  }
}
