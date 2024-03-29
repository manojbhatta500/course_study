import 'dart:developer';

import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_list_bloc/course_list_bloc.dart';
import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_update_bloc/course_update_event.dart';
import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_update_bloc/course_update_state.dart';
import 'package:coursestudy/feature/admin/course_list_screen/course_list_repo/course_update_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../course_list_repo/delete_course_repository.dart';
import 'delete_course_event.dart';
import 'delete_course_state.dart';

class DeleteCourseBloc extends Bloc<DeleteCourseEvent, DeleteCourseState> {
  DeleteCourseRepository deleteCourseRepository = DeleteCourseRepository();
  DeleteCourseBloc() : super(InitialDeleteCourseState()) {
    on<FetchDeleteCourseEvent>((event, emit) async {
      log('bloc step 1');
      emit(LoadingDeleteCourseState());
      log('bloc step 2');

      bool deleteCourse = await deleteCourseRepository.deleteCourse(
        event.id,
      );
      log('bloc step 3');

      if (deleteCourse) {
        log('bloc step 4');

        log('this is success state');
        emit(SuccessDeleteCourseState());
      } else {
        log('bloc step 5');

        log('this is not success state');

        emit(ErrorDeleteCourseState());
      }
    });
  }
}
