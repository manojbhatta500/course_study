part of 'course_list_bloc.dart';

sealed class CourseListState extends Equatable {
  const CourseListState();

  @override
  List<Object> get props => [];
}

final class CourseListInitial extends CourseListState {}

final class CourseListLoadingState extends CourseListState {}

final class CourseListSuccessState extends CourseListState {
  final List<CourseModel> courseList;

  CourseListSuccessState(this.courseList);

  @override
  // TODO: implement props
  List<Object> get props => [courseList];
}

final class CourseListFailedState extends CourseListState {}
