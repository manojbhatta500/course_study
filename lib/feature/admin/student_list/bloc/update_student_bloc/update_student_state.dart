import 'package:equatable/equatable.dart';

sealed class UpdateStudentState extends Equatable{
  @override

  List<Object?> get props => [];
}

class InitialUpdateStudentState extends UpdateStudentState{}
class LoadingUpdateStudentState extends UpdateStudentState{}
class ErrorUpdateStudentState extends UpdateStudentState{}
class SuccessUpdateStudentState extends UpdateStudentState{}