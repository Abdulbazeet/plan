part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class Authenticated extends AuthState {
  final UserMoodel userModel;
  final User user;

  const Authenticated({required this.user, required this.userModel});

  @override
  List<Object> get props => [user];
}

final class Unauthenticated extends AuthState {}

final class AuthFailure extends AuthState {
  final String errorMessage;

  const AuthFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
