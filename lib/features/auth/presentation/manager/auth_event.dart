part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({
    required this.email,
    required this.password,
  });
}

final class AuthRegisterEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final String password;

  AuthRegisterEvent({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.password,
  });
}

final class AuthUserIsLoggedInEvent extends AuthEvent{}
