import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/mixins/authorization_of_another_service.dart';

part 'sign_in_cubit.freezed.dart';

enum SignInStatus {
  idle,
  error,
  loading;

  bool get isError => this == error;
  bool get isLoading => this == loading;
  bool get isIdle => this == idle;
}

class SignInCubit extends Cubit<SignInState>
    with AuthorizationOfAnotherServiceMixin {
  SignInCubit() : super(const SignInState());

  void signIn(String email, String password) async {
    emit(state.copyWith(status: SignInStatus.loading));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(status: SignInStatus.error));
      if (e.code == 'user-not-found') {
        emit(state.copyWith(error: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(state.copyWith(error: 'wrong-password'));
      } else if (e.code == 'invalid-email') {
        emit(state.copyWith(error: 'invalid-email'));
      }
    }
  }
}

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(SignInStatus.idle) final SignInStatus status,
    final String? error,
  }) = _SignInState;
}
