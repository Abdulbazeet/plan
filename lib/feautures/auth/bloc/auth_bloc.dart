import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plan/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription _authSub;
  AuthBloc() : super(AuthInitial()) {
    on<AuthUserChanges>(_authEventHandler);

    _authSub = FirebaseAuth.instance.authStateChanges().listen((user) {
      add(AuthUserChanges(user: user));
    });
  }
  void _authEventHandler(AuthUserChanges event, Emitter<AuthState> emit) async {
    final firebaseUser = event.user;
    if (firebaseUser != null) {
      try {
        final doc =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(firebaseUser.uid)
                .get();
        if (doc.exists) {
          final userModel = UserMoodel.fromMap(doc.data()!);
          emit(Authenticated(user: firebaseUser, userModel: userModel));
        } else {
          emit(
            AuthFailure(errorMessage: 'User does not exist in the database'),
          );
        }
      } catch (e) {
        emit(AuthFailure(errorMessage: e.toString()));
      }
    } else {
      emit(Unauthenticated());
    }
  }

  @override
  Future<void> close() {
    _authSub.cancel();
    return super.close();
  }
}
