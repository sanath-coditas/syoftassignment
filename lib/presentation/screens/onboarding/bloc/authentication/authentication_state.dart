part of 'authentication_bloc.dart';

sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class FailureState extends AuthenticationState {
  FailureState({required this.message});
  final String message;
}

class AuthenticationSuccessfulState extends AuthenticationState {}
