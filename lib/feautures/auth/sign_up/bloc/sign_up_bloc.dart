import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<NormalSignUp>(_onNormalSignUp);
  }
  Future<void> _onNormalSignUp(
    NormalSignUp event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
      if (credentials.user != null) {
        emit(SignUpSuccess());
      } else {
        emit(SignUpFailure(errorMessage: 'Sign up failed'));
      }
    } on FirebaseAuthException catch (e) {
      emit(
        SignUpFailure(errorMessage: e.message ?? 'An unknown error occurred'),
      );
    } catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
    }
  }
}
