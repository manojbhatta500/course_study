part of 'admin_home_page_bloc.dart';

sealed class AdminHomePageState extends Equatable {
  const AdminHomePageState();

  @override
  List<Object> get props => [];
}

// final class AdminHomePageInitial extends AdminHomePageState {}

final class Page1 extends AdminHomePageState {}

final class Page2 extends AdminHomePageState {}

final class Page3 extends AdminHomePageState {}

final class Page4 extends AdminHomePageState {}
