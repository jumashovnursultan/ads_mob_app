import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'sign_up_cubit.freezed.dart';

enum SignUpStatus {
  idle,
  success,
  error,
  loading;

  bool get isIdle => this == idle;
  bool get isSuccess => this == success;
  bool get isError => this == error;
  bool get isLoading => this == loading;
}

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  Future signUp(String email, String password) async {
    emit(state.copyWith(status: SignUpStatus.loading));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(state.copyWith(status: SignUpStatus.success));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(status: SignUpStatus.error));
      if (e.code == 'invalid-email') {
        emit(state.copyWith(error: 'invalid-email'));
      } else if (e.code == 'weak-password') {
        emit(state.copyWith(error: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(state.copyWith(error: 'email-already-in-use'));
      }
    }
  }
}

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(SignUpStatus.idle) final SignUpStatus status,
    final String? error,
  }) = _SignUpState;
}
