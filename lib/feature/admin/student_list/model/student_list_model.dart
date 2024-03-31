class StudentListModel {
  String? id;
  String? name;
  String? dOB;
  String? joinedDate;
  String? completedDate;
  String? createdAt;
  Course? course;

  StudentListModel(
      {this.id,
      this.name,
      this.dOB,
      this.joinedDate,
      this.completedDate,
      this.createdAt,
      this.course});

  StudentListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dOB = json['DOB'];
    joinedDate = json['joinedDate'];
    completedDate = json['completedDate'];
    createdAt = json['createdAt'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['DOB'] = dOB;
    data['joinedDate'] = joinedDate;
    data['completedDate'] = completedDate;
    data['createdAt'] = createdAt;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    return data;
  }
}

class Course {
  String? id;
  String? name;
  String? description;
  String? createdAt;

  Course({this.id, this.name, this.description, this.createdAt});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['createdAt'] = createdAt;
    return data;
  }
}
