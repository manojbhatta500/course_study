import 'package:equatable/equatable.dart';

sealed class UpdateStudentEvent extends Equatable {}

class FetchUpdateStudentEvent extends UpdateStudentEvent {
  final String course;
  final String name;
  final String id;
  final String dateofBirth;
  final String joinDate;
  final String completeDate;

  FetchUpdateStudentEvent(
    this.course,
    this.id,
    this.completeDate,
    this.dateofBirth,
    this.joinDate,
    this.name,
  );
  @override
  List<Object?> get props => [course, id, name, joinDate, dateofBirth, completeDate];
}
