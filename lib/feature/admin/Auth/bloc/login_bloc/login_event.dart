import 'package:equatable/equatable.dart';

sealed class LoginEvent extends Equatable {}

class FetchLoginEvent extends LoginEvent {
  final String email;
  final String password;

  FetchLoginEvent(
    this.email, this.password
  );

  @override

  List<Object?> get props => [email, password];
}
