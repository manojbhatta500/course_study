import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coursestudy/feature/admin/course_list_screen/course_list_repo/course_list_repository.dart';
import 'package:equatable/equatable.dart';

part 'course_list_event.dart';
part 'course_list_state.dart';

class CourseListBloc extends Bloc<CourseListEvent, CourseListState> {
  CourseListBloc() : super(CourseListInitial()) {
    on<FetchCourseListEvent>(_fetchCourseListEvent);
  }

  CourseListRepository blocManager = CourseListRepository();

  FutureOr<void> _fetchCourseListEvent(
      FetchCourseListEvent event, Emitter<CourseListState> emit) async {
    var serverurl = 'url';
    emit(CourseListLoadingState());
    final repoResponse = await blocManager.fetchRepoFromServer(serverurl);
    if (repoResponse == 1) {
      emit(CourseListSuccessState());
    } else {
      emit(CourseListFailedState());
    }
  }
}
