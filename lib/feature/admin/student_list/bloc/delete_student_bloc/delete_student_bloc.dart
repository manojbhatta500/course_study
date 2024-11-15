import 'dart:developer';


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/delete_student_repository.dart';
import 'delete_student_event.dart';
import 'delete_student_state.dart';



class DeleteStudentBloc extends Bloc<DeleteStudentEvent, DeleteStudentState> {
  DeleteStudentRepository deleteStudentRepository = DeleteStudentRepository();
  DeleteStudentBloc() : super(InitialDeleteStudentState()) {
    on<FetchDeleteStudentEvent>((event, emit) async {
 
      emit(LoadingDeleteStudentState());
      log('bloc delete student step 2');

      bool deleteCourse = await deleteStudentRepository.deleteStudent(
        event.id,
      );
      log('bloc delete student step 3');

      if (deleteCourse) {
 

        log('this is success state delete student');
        emit(SuccessDeleteStudentState());
      } else {
        log('bloc step 5 delete student');

      

        emit(ErrorDeleteStudentState());
      }
    });
  }
}
