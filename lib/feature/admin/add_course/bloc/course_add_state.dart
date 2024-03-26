part of 'course_add_bloc.dart';

sealed class CourseAddState extends Equatable {
  const CourseAddState();

  @override
  List<Object> get props => [];
}

final class CourseAddInitial extends CourseAddState {}

final class AddCourseInitial extends CourseAddState {}

final class AddCourseLoading extends CourseAddState {}

final class AddCourseSuccess extends CourseAddState {}

final class AddCourseFailed extends CourseAddState {}
