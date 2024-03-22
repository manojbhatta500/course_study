import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class UserRepository {
  UserModel userModel = UserModel();

  Future<dynamic> userPost(String id) async {
    final response = await http.get(
      Uri.parse("http://192.168.1.81:3000/api/v1/student/$id"),
      // Uri.parse(
      //     "http://192.168.1.81:3000/api/v1/student/3249509b409f4da9a4d647812f0e5878"),
    );
    try {
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = UserModel.fromJson(jsonDecode(response.body));

        //final data = jsonDecode(response.body);

        userModel = data;
        log("after status code 201");
        log(response.toString());

        return userModel;
      } else {
        log("this is else");
        throw Exception("fail to search student else");
      }
    } catch (e) {
      log("this is catch");
      throw Exception("fail to search student catch");
    }
  }
}
