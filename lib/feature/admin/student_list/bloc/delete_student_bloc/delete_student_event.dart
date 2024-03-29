import 'package:equatable/equatable.dart';

sealed class DeleteStudentEvent extends Equatable {}

class FetchDeleteStudentEvent extends DeleteStudentEvent {
 
  final String id;

  FetchDeleteStudentEvent(
     this.id,
  );
  @override
  List<Object?> get props => [ id];
}
