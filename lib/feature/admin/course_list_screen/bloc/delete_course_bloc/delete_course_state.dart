import 'package:equatable/equatable.dart';

sealed class DeleteCourseState extends Equatable{
  @override

  List<Object?> get props => [];
}

class InitialDeleteCourseState extends DeleteCourseState{}
class LoadingDeleteCourseState extends DeleteCourseState{}
class ErrorDeleteCourseState extends DeleteCourseState{}
class SuccessDeleteCourseState extends DeleteCourseState{}