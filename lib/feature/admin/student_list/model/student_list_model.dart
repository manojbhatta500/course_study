class StudentListModel {
  String? id;
  String? name;
  String? dOB;
  String? joinedDate;
  String? completedDate;
  String? course;
  String? createdAt;

  StudentListModel(
      {this.id,
      this.name,
      this.dOB,
      this.joinedDate,
      this.completedDate,
      this.course,
      this.createdAt});

  StudentListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dOB = json['DOB'];
    joinedDate = json['joinedDate'];
    completedDate = json['completedDate'];
    course = json['course'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['DOB'] = dOB;
    data['joinedDate'] = joinedDate;
    data['completedDate'] = completedDate;
    data['course'] = course;
    data['createdAt'] = createdAt;
    return data;
  }
}
