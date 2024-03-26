import 'package:coursestudy/feature/admin/student_list/model/student_list_model.dart';
import 'package:equatable/equatable.dart';

sealed class AddStudentState extends Equatable{
  @override

  List<Object?> get props => [];
}

class InitialAddStudentState extends AddStudentState {}

class LoadingAddStudentState extends AddStudentState {}

class ErrorAddStudentState extends AddStudentState {}

class SuccessAddStudentState extends AddStudentState {


}