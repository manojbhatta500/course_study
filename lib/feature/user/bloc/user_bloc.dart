import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coursestudy/feature/user/bloc/user_event.dart';
import 'package:coursestudy/feature/user/bloc/user_state.dart';
import 'package:coursestudy/feature/user/repository/user_repository.dart';

import '../model/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository = UserRepository();
  UserBloc() : super(InitialUserState()) {
    on<FetchUserEvent>((event, emit) async {
      emit(LoadingUserState());

      UserModel? checkData = await userRepository.userPost(event.id);

      if (checkData == null) {
        log("this is bloc error state");
        emit(ErrorUserState());
      } else {
        log("this is bloc success");
        emit(SuccessUserState(checkData));
      }
    });
  }
}
