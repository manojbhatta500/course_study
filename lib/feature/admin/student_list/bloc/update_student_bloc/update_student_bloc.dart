import 'dart:developer';

import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_list_bloc/course_list_bloc.dart';
import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_update_bloc/course_update_event.dart';
import 'package:coursestudy/feature/admin/course_list_screen/bloc/course_update_bloc/course_update_state.dart';
import 'package:coursestudy/feature/admin/course_list_screen/course_list_repo/course_update_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/update_student_repository.dart';
import 'update_student_event.dart';
import 'update_student_state.dart';

class UpdatetudentBloc extends Bloc<UpdateStudentEvent, UpdateStudentState> {
  UpdateStudentRepository updateStudentRepository = UpdateStudentRepository();
  UpdatetudentBloc() : super(InitialUpdateStudentState()) {
    on<FetchUpdateStudentEvent>((event, emit) async {
      log('bloc step 1');
      emit(LoadingUpdateStudentState());
      log('bloc step 2');

      bool courseUpdate = await updateStudentRepository.updateStudent(
          event.course,
          event.name,
          event.id,
          event.completeDate,
          event.dateofBirth,
          event.joinDate);
      log('bloc step 3');

      if (courseUpdate) {
        log('bloc step 4');

        log('this is success state update');
        emit(SuccessUpdateStudentState());
      } else {
        log('bloc step 5');

        log('this is not success state');

        emit(ErrorUpdateStudentState());
      }
    });
  }
}
