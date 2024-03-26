import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class AddStudentRepository {
  Map<String, String> heading = {
    'Content-Type': 'application/json',
  };
  Future<dynamic> addStudent(String name, String course, String dateofBirth,
      String joinDate, String completeDate) async {
    final response = await http.post(
      Uri.parse(
        "http://192.168.1.81:3000/api/v1/student",
      ),
      headers: heading,
      body: jsonEncode({
        "name": name,
        "DOB": dateofBirth,
        "joinedDate": joinDate,
        "completedDate": completeDate,
        "course": course,
      }),
    );
    log(response.body);

    try {
      log(" above if message");
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception("this is repo else");
      }
    } catch (e) {
      throw Exception("this is repo catch");
    }
  }
}
