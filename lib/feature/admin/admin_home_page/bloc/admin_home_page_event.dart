part of 'admin_home_page_bloc.dart';

sealed class AdminHomePageEvent extends Equatable {
  const AdminHomePageEvent();

  @override
  List<Object> get props => [];
}

final class AdminClickEvent extends AdminHomePageEvent {
  final int id;

  const AdminClickEvent({required this.id});

  @override
  List<Object> get props => [id];
}
