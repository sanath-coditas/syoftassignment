// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

class AuthenticateEvent extends AuthenticationEvent {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? password;
  final String? phoneNumber;
  final String? city;
  final String? zipcode;
  final bool isSignIn;
  AuthenticateEvent({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.phoneNumber,
    this.city,
    this.zipcode,
    required this.isSignIn,
  });
}
