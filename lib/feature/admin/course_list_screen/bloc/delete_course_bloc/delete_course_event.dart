import 'package:equatable/equatable.dart';

sealed class DeleteCourseEvent extends Equatable {}

class FetchDeleteCourseEvent extends DeleteCourseEvent {
 
  final String id;

  FetchDeleteCourseEvent(
     this.id,
  );
  @override
  List<Object?> get props => [ id];
}
