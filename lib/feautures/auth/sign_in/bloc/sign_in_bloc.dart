import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plan/models/user.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<NormalSignIn>(_onNormalSignIn);
  }
  Future<void> _onNormalSignIn(
    NormalSignIn event,
    Emitter<SignInState> emit,
  ) async {
    emit(SignInLoading());
    try {
      UserMoodel userModel = UserMoodel(
        uid: '',
        username: '',
        email: '',
        password: '',
        userList: null,
      );
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
      if (credentials.user != null) {
        final db = FirebaseFirestore.instance;
        await db
            .collection('users')
            .doc(credentials.user!.uid)
            .set(userModel.toMap());

        emit(SignInSuceess());
      } else {
        emit(SignInFailure(errorMessage: 'Sign in failed'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.message ==
          "The supplied auth credential is incorrect, malformed or has expired.") {
        emit(
          SignInFailure(errorMessage: 'The provided credentials is incorrect'),
        );
      } else {
        emit(
          SignInFailure(errorMessage: e.message ?? 'An unknown error occurred'),
        );
      }
    } catch (e) {
      emit(SignInFailure(errorMessage: e.toString()));
    }
  }
}
