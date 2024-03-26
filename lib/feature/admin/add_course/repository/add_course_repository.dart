import 'dart:convert';
import 'dart:developer';

import 'package:coursestudy/util/apis.dart';
import 'package:coursestudy/util/http_manager.dart';
import 'package:http/http.dart';

class AddCourseRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<int> fetchRepoFromServer(String courseName, String courseDisc) async {
    var sendData = {"name": courseName, "description": courseDisc};
    try {
      Response respo = await manager.hitApi(
          requestType: RequestEnum.post,
          apiUrl: Apis.postCourseApi,
          prameter: jsonEncode(sendData));
      if (respo.statusCode == 200 || respo.statusCode == 201) {
        log('this is success');
        log(respo.body);
        return 1;
      } else {
        log('this is false');
        log(respo.body);

        return 0;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
