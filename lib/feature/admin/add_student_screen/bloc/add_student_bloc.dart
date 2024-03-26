import 'package:bloc/bloc.dart';
import 'package:coursestudy/feature/admin/add_student_screen/bloc/add_student_event.dart';
import 'package:coursestudy/feature/admin/add_student_screen/bloc/add_student_state.dart';
import 'package:coursestudy/feature/admin/add_student_screen/repository/add_student_repository.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  AddStudentRepository addStudentRepository = AddStudentRepository();
  AddStudentBloc() : super(InitialAddStudentState()) {
    on<FetchAddStudentEvent>((event, emit) async {
      emit(LoadingAddStudentState());

      final studentAdd = await addStudentRepository.addStudent(
        event.name,
        event.course,
        event.dateofBirth,
        event.joinDate,
        event.completeDate,
      );
      if (studentAdd == null) {
        emit(ErrorAddStudentState());
      } else {
        emit(SuccessAddStudentState());
      }
    });
  }
}
