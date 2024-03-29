import 'package:coursestudy/feature/admin/student_list/model/student_list_model.dart';
import 'package:equatable/equatable.dart';

sealed class StudentListState extends Equatable{
  @override

  List<Object?> get props => [];
}

class InitialStudentListState extends StudentListState {}

class LoadingStudentListState extends StudentListState {}

class ErrorStudentListState extends StudentListState {}

class SuccessStudentListState extends StudentListState {
  final List<StudentListModel> studentListModel;

  SuccessStudentListState(this.studentListModel);
  @override

  List<Object?> get props => [studentListModel];
}