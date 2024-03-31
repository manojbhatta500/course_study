import 'dart:convert';
import 'dart:developer';

import 'package:coursestudy/util/apis.dart';
import 'package:http/http.dart';

import '../../../../util/http_manager.dart';

class SignUpRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<bool> adminSignUp(
      String fullName, String email, String password) async {
    final response = await manager.hitApi(
        requestType: RequestEnum.post,
        apiUrl: Apis.signUpApi,
        prameter: jsonEncode({
          "name": fullName,
          "email": email,
          "password": password,
        }));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body);
        log("this is signup repo 200");

        return true;
      } else {
        log("this is login repo else");
        log(response.body);
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
