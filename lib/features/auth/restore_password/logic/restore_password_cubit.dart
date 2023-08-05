import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'restore_password_cubit.freezed.dart';

enum RestorePasswordStatus {
  idle,
  error,
  loading;

  bool get isError => this == error;
  bool get isLoading => this == loading;
  bool get isIdle => this == idle;
}

class RestorePasswordCubit extends Cubit<RestorePasswordState> {
  RestorePasswordCubit() : super(const RestorePasswordState());

  Future passwordReset(String email) async {
    emit(state.copyWith(status: RestorePasswordStatus.loading));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(status: RestorePasswordStatus.error));
      if (e.code == 'invalid-email') {
        emit(state.copyWith(error: 'invalid-email'));
      } else if (e.code == 'user-not-found') {
        emit(state.copyWith(error: 'user-not-found'));
      }
    }
  }
}

@freezed
class RestorePasswordState with _$RestorePasswordState {
  const factory RestorePasswordState({
    @Default(RestorePasswordStatus.idle) final RestorePasswordStatus status,
    final String? error,
  }) = _RestorePasswordState;
}
