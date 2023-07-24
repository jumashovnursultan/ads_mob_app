import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_cubit.freezed.dart';

enum SignInStatus {
  idle,
  error,
  success,
  userNotFound,
  loading;

  bool get isSuccess => this == success;
  bool get isError => this == error;
  bool get isLoading => this == loading;
  bool get isIdle => this == idle;
  bool get isNotFound => this == userNotFound;
}

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());

  void signIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(SignInStatus.idle) final SignInStatus status,
  }) = _SignInState;
}
