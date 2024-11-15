import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coursestudy/feature/admin/student_list/bloc/student_list_bloc/student_list_event.dart';
import 'package:coursestudy/feature/admin/student_list/bloc/student_list_bloc/student_list_state.dart';
import 'package:coursestudy/feature/admin/student_list/model/student_list_model.dart';
import 'package:coursestudy/feature/admin/student_list/repository/student_list_repository.dart';

class StudentListBloc extends Bloc<StudentListEvent, StudentListState> {
  StudentListRepository studentListRepository = StudentListRepository();

  StudentListBloc() : super(InitialStudentListState()) {
    on<FetchStudentListEvent>((event, emit) async {
      emit(LoadingStudentListState());
      List<StudentListModel> checkData =
          await studentListRepository.studentList();

      if (checkData.isNotEmpty) {
        log("this is bloc success");
        emit(SuccessStudentListState(checkData));
      } else {
        log("this is bloc error state");
        emit(ErrorStudentListState());
      }
    });
  }
}
