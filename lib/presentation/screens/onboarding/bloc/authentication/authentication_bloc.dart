import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syoftassignment/entities/person_entity.dart';

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
      emit(
        AuthenticationSuccessfulState(
          personEntity: PersonEntity(
            city: event.city,
            email: event.email,
            firstName: event.firstName,
            lastName: event.lastName,
            phone: event.phoneNumber,
            zipCode: event.zipcode,
          ),
        ),
      );
    } catch (e) {
      emit(FailureState(message: e.toString()));
    }
  }
}
