part of 'course_list_bloc.dart';

sealed class CourseListState extends Equatable {
  const CourseListState();

  @override
  List<Object> get props => [];
}

final class CourseListInitial extends CourseListState {}

final class CourseListLoadingState extends CourseListState {}

final class CourseListSuccessState extends CourseListState {}

final class CourseListFailedState extends CourseListState {}
