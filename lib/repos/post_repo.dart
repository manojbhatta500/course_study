import 'dart:developer';

import 'package:coursestudy/util/http_manager.dart';
import 'package:http/http.dart';

class PostRepo {
  HttpManager manager = HttpManager(client: Client());

  void fetchRepoFromServer(String url, var param) async {
    try {
      Response respo = await manager.hitApi(
          requestType: RequestEnum.get, apiUrl: url, prameter: param);
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
