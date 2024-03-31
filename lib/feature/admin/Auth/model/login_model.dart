class LoginModel {
  String? token;
  int? status;

  LoginModel({this.token, this.status});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['status'] = status;
    return data;
  }
}
