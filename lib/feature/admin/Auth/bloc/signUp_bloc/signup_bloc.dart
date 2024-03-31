import 'package:bloc/bloc.dart';
import 'package:coursestudy/feature/admin/Auth/bloc/signUp_bloc/signup_state.dart';

import '../../repository/sign_up_repository.dart';
import 'signup_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpRepository signUpRepository = SignUpRepository();
  SignUpBloc() : super(InitialSignUpState()) {
    on<FetchSignUpEvent>((event, emit) async {
      emit(LoadingSignUpState());

      final login = await signUpRepository.adminSignUp(
          event.fullName, event.email, event.password);

      if (login == true) {
        emit(SuccessSignUpState());
      } else {
        emit(ErrorSignUpState());
      }
    });
  }
}
