part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class NormalSignUp extends SignUpEvent {
  final String email;
  final String password;
  final String username;

  NormalSignUp({
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  List<Object?> get props => [email, password, username];
}
