part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

final class NormalSignIn extends SignInEvent {
  final String email;
  final String password;

  const NormalSignIn({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}
