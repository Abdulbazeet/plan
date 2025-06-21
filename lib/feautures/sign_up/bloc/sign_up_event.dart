part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class _onSignUp extends SignUpEvent {
  final String email;
  final String password;
  final String username;

  _onSignUp({
    required this.email,
    required this.password,
    required this.username,
  });
}
