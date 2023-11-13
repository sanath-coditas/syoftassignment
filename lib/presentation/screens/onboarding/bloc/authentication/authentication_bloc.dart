import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});
    on<AuthenticateEvent>(_authenticate);
  }

  Future<FutureOr<void>> _authenticate(
      AuthenticateEvent event, Emitter<AuthenticationState> emit) async {
    try {
      emit(LoadingState());
      // As API is not working just awaiting to mock API call
      await Future.delayed(const Duration(seconds: 3));
      emit(AuthenticationSuccessfulState());
    } catch (e) {
      emit(FailureState(message: e.toString()));
    }
  }
}
