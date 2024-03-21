import 'package:http/http.dart';

enum RequestEnum { get, post, patch, delete }

class HttpManager {
  final Client client;
  HttpManager({required this.client});

  Future<Response> hitApi(
      {required RequestEnum requestType,
      required String apiUrl,
      dynamic prameter}) {
    Map<String, String> heading = {
      'Content-Type': 'application/json',
    };

    Map<String, String> headingWithToken = {
      'Authorization': 'Bearer //tokenvariable',
    };
    Map<String, String> headingWithPatchToken = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer //tokenvariable',
    };

    switch (requestType) {
      case RequestEnum.get:
        return client.get(Uri.parse(apiUrl), headers: heading);
      case RequestEnum.post:
        return client.post(Uri.parse(apiUrl),
            headers: headingWithToken, body: prameter);
      case RequestEnum.delete:
        return client.post(Uri.parse(apiUrl),
            headers: headingWithToken, body: prameter);
      case RequestEnum.patch:
        return client.patch(Uri.parse(apiUrl),
            headers: headingWithPatchToken, body: prameter);
      default:
        throw Exception('sorry the provided path is not right');
    }
  }
}
