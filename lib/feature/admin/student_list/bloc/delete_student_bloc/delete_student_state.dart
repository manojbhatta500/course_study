import 'package:equatable/equatable.dart';

sealed class DeleteStudentState extends Equatable{
  @override

  List<Object?> get props => [];
}

class InitialDeleteStudentState extends DeleteStudentState{}
class LoadingDeleteStudentState extends DeleteStudentState{}
class ErrorDeleteStudentState extends DeleteStudentState{}
class SuccessDeleteStudentState extends DeleteStudentState{}