import 'dart:developer';

import 'package:coursestudy/util/http_manager.dart';
import 'package:http/http.dart';

class GetRepo {
  HttpManager manager = HttpManager(client: Client());

  void fetchRepoFromServer(String url) async {
    try {
      Response respo =
          await manager.hitApi(requestType: RequestEnum.get, apiUrl: url);
      if (respo.statusCode == 200) {
        log('this is success');
      } else {
        log('this is false');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
