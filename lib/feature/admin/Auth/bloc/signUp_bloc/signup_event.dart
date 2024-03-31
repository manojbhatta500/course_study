import 'package:equatable/equatable.dart';

sealed class SignUpEvent extends Equatable {}

class FetchSignUpEvent extends SignUpEvent {
  final String fullName;
  final String email;
  final String password;

  FetchSignUpEvent(
    this.email,
    this.password,
    this.fullName,
  );

  @override
  List<Object?> get props => [email, password, fullName];
}
