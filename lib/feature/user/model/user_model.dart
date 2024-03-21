class UserModel {
  String? id;
  String? name;
  String? dOB;
  String? joinedDate;
  String? completedDate;
  String? createdAt;

  UserModel(
      {this.id,
      this.name,
      this.dOB,
      this.joinedDate,
      this.completedDate,
      this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dOB = json['DOB'];
    joinedDate = json['joinedDate'];
    completedDate = json['completedDate'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['DOB'] = dOB;
    data['joinedDate'] = joinedDate;
    data['completedDate'] = completedDate;
    data['createdAt'] = createdAt;
    return data;
  }
}
