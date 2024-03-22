import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_home_page_event.dart';
part 'admin_home_page_state.dart';

class AdminHomePageBloc extends Bloc<AdminHomePageEvent, AdminHomePageState> {
  AdminHomePageBloc() : super(Page1()) {
    on<AdminClickEvent>(_adminClickEvent);
  }

  FutureOr<void> _adminClickEvent(
      AdminClickEvent event, Emitter<AdminHomePageState> emit) {
    switch (event.id) {
      case 0:
        emit(Page1());
      case 1:
        emit(Page2());

      case 2:
        emit(Page3());

      case 3:
        emit(Page4());

      default:
        print('not valid');
    }
  }
}
