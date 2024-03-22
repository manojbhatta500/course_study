import 'package:coursestudy/feature/user/model/user_model.dart';
import 'package:equatable/equatable.dart';

sealed class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialUserState extends UserState {}

class LoadingUserState extends UserState {}

class ErrorUserState extends UserState {}

class SuccessUserState extends UserState {
  final UserModel userModel;

  SuccessUserState(this.userModel);
  @override

  List<Object?> get props => [userModel];
}
