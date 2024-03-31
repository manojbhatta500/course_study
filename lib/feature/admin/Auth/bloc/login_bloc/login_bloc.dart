import 'package:bloc/bloc.dart';
import 'package:coursestudy/feature/admin/Auth/bloc/login_bloc/login_event.dart';
import 'package:coursestudy/feature/admin/Auth/bloc/login_bloc/login_state.dart';
import 'package:coursestudy/feature/admin/Auth/repository/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository = LoginRepository();
  LoginBloc() : super(InitialLoginState()) {
    on<FetchLoginEvent>((event, emit) async {
      emit(LoadingLoginState());

      final login =
          await loginRepository.adminLogin(event.email, event.password);

      if (login == true) {
        emit(SuccessLoginState());
      } else {
        emit(ErrorLoginState());
      }
    });
  }
}
