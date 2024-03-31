import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable{
  @override

  List<Object?> get props => [];
}

class InitialLoginState extends LoginState{}
class LoadingLoginState extends LoginState{}
class ErrorLoginState extends LoginState{}
class SuccessLoginState extends LoginState{}

