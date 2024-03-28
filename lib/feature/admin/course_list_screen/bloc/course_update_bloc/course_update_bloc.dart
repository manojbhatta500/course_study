import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_update_bloc/course_update_event.dart';
import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_update_bloc/course_update_state.dart';
import 'package:coursestudy/feature/admin/course_list_screen/course_list_repo/course_update_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseUpdateBloc extends Bloc<CourseUpdateEvent, CourseUpdateState> {
  CourseUpdateRepository courseUpdateRepository = CourseUpdateRepository();
  CourseUpdateBloc() : super(InitialCourseUpdateState()) {
    on<FetchCourseUpdateEvent>((event, emit) async {
      emit(LoadingCourseUpdateState());

      final courseUpdate = await courseUpdateRepository.updateCourse(
        event.course,
        event.description,
        event.id,
      );

      if (courseUpdate.statusCode == 201) {
        emit(SuccessCourseUpdateState());
      } else {
        emit(ErrorCourseUpdateState());
      }
      
    });
  }
}
