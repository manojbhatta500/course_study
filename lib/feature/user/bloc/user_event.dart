import 'package:equatable/equatable.dart';

sealed class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUserEvent extends UserEvent {
  final String id;
  FetchUserEvent(this.id);

  @override

  List<Object?> get props => [id];
}
