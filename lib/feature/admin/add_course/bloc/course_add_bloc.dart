import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coursestudy/feature/admin/add_course/repository/add_course_repository.dart';
import 'package:equatable/equatable.dart';

part 'course_add_event.dart';
part 'course_add_state.dart';

class CourseAddBloc extends Bloc<CourseAddEvent, CourseAddState> {
  CourseAddBloc() : super(CourseAddInitial()) {
    on<UserAddCourseEvent>(_userAddCourseEvent);
  }

  AddCourseRepository blocManager = AddCourseRepository();

  FutureOr<void> _userAddCourseEvent(
      UserAddCourseEvent event, Emitter<CourseAddState> emit) async {
    emit(AddCourseLoading());
    int repoResponse = await blocManager.fetchRepoFromServer(
        event.courseName, event.courseDisc);
    if (repoResponse == 1) {
      emit(AddCourseSuccess());
    } else if (repoResponse == 0) {
      emit(AddCourseFailed());
    } else {
      log('this is else statement inside the bloc code');
    }
  }
}
