import 'package:equatable/equatable.dart';

sealed class StudentListEvent extends Equatable{
  @override
 
  List<Object?> get props => [];
}

class FetchStudentListEvent extends StudentListEvent{

}