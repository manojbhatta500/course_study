import 'dart:developer';

import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_list_bloc/course_list_bloc.dart';
import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_update_bloc/course_update_event.dart';
import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_update_bloc/course_update_state.dart';
import 'package:coursestudy/feature/admin/course_list_screen/course_list_repo/course_update_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseUpdateBloc extends Bloc<CourseUpdateEvent, CourseUpdateState> {
  CourseUpdateRepository courseUpdateRepository = CourseUpdateRepository();
  CourseUpdateBloc() : super(InitialCourseUpdateState()) {
    on<FetchCourseUpdateEvent>((event, emit) async {
      log('bloc step 1');
      emit(LoadingCourseUpdateState());
      log('bloc step 2');

      bool courseUpdate = await courseUpdateRepository.updateCourse(
        event.course,
        event.description,
        event.id,
      );
      log('bloc step 3');

      if (courseUpdate) {
        log('bloc step 4');
      
        log('this is success state');
        emit(SuccessCourseUpdateState());
      } else {
        log('bloc step 5');

        log('this is not success state');

        emit(ErrorCourseUpdateState());
      }
    });
  }
}
