import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../../../../util/http_manager.dart';

class LoginRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<bool> adminLogin(String email, String password) async {
    final response = await manager.hitApi(
        requestType: RequestEnum.post,
        apiUrl: "",
        prameter: jsonEncode({
          "email": email,
          "password": password,
        }));

   try{
     if (response.statusCode == 200 || response.statusCode == 201) {
      log(response.body);
      log("this is login repo 200");
      return true;
    } else {
      log("this is login repo else");
      log(response.body);
      return false;
    }
   } catch (e){
    throw Exception(e);
   }
  } 
}
