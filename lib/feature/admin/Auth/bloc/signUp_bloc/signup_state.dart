import 'package:equatable/equatable.dart';

sealed class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialSignUpState extends SignUpState {}

class LoadingSignUpState extends SignUpState {}

class ErrorSignUpState extends SignUpState {}

class SuccessSignUpState extends SignUpState {}
