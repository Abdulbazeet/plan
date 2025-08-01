part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthUserChanges extends AuthEvent {
  final User? user;

  const AuthUserChanges({required this.user});

  @override
  List<Object> get props => [user!];
}
