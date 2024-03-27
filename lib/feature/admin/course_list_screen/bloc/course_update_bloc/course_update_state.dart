import 'package:equatable/equatable.dart';

sealed class CourseUpdateState extends Equatable{
  @override

  List<Object?> get props => [];
}

class InitialCourseUpdateState extends CourseUpdateState{}
class LoadingCourseUpdateState extends CourseUpdateState{}
class ErrorCourseUpdateState extends CourseUpdateState{}
class SuccessCourseUpdateState extends CourseUpdateState{}