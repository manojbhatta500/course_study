part of 'course_list_bloc.dart';

sealed class CourseListEvent extends Equatable {
  const CourseListEvent();

  @override
  List<Object> get props => [];
}

final class FetchCourseListEvent extends CourseListEvent {}
