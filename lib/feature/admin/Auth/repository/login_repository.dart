import 'dart:convert';
import 'dart:developer';

import 'package:coursestudy/feature/admin/Auth/model/login_model.dart';
import 'package:coursestudy/util/apis.dart';
import 'package:coursestudy/util/token_api.dart';
import 'package:http/http.dart';

import '../../../../util/http_manager.dart';

class LoginRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<bool> adminLogin(String email, String password) async {
    final response = await manager.hitApi(
        requestType: RequestEnum.post,
        apiUrl: Apis.loginApi,
        prameter: jsonEncode({
          "email": email,
          "password": password,
        }));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = LoginModel.fromJson(jsonDecode(response.body));
        TokenApi.accessToken = data.token.toString();
        log(TokenApi.accessToken.toString());
        log("this is login repo 200");
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
