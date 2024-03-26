part of 'course_add_bloc.dart';

sealed class CourseAddEvent extends Equatable {
  const CourseAddEvent();

  @override
  List<Object> get props => [];
}

final class UserAddCourseEvent extends CourseAddEvent {
  final String courseName;
  final String courseDisc;
  UserAddCourseEvent({required this.courseName, required this.courseDisc});
}
