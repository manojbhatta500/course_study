import 'dart:developer';

import 'package:coursestudy/util/http_manager.dart';
import 'package:http/http.dart';

class CourseListRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<int> fetchRepoFromServer(String url) async {
    try {
      Response respo =
          await manager.hitApi(requestType: RequestEnum.get, apiUrl: url);
      if (respo.statusCode == 200) {
        log('this is success');
        return 1;
      } else {
        log('this is false');
        return 0;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
