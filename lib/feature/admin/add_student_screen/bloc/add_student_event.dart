import 'package:equatable/equatable.dart';

sealed class AddStudentEvent extends Equatable {}

class FetchAddStudentEvent extends AddStudentEvent {
  final String name;
  final String course;
  final String dateofBirth;

  final String joinDate;
  final String completeDate;

  FetchAddStudentEvent(this.course, this.completeDate, this.dateofBirth,
      this.joinDate, this.name);

      @override
  
  List<Object?> get props => [name, completeDate, joinDate, dateofBirth, course];
}
