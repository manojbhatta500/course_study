import 'package:equatable/equatable.dart';

sealed class CourseUpdateEvent extends Equatable {}

class FetchCourseUpdateEvent extends CourseUpdateEvent {
  final String course;
  final String description;
  final String id;

  FetchCourseUpdateEvent(
    this.course,
    this.description, this.id,
  );
  @override
  List<Object?> get props => [course, description, id];
}
