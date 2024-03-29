import 'dart:convert';
import 'dart:developer';

import 'package:coursestudy/util/apis.dart';
import 'package:http/http.dart';

import '../../../../util/http_manager.dart';

class DeleteStudentRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<bool> deleteStudent(
    String id,
  ) async {
    Response response = await manager.hitApi(
      requestType: RequestEnum.delete,
      apiUrl: "${Apis.deleteStudentApi}/$id",
    );

    try {
      if (response.statusCode == 201 || response.statusCode == 200) {
        
        log(response.body);

        return true;
      } else {
       

        return false;
      }
    } catch (e) {
      throw Exception(" this is delete student else this is repo catch");
    }
  }
}
