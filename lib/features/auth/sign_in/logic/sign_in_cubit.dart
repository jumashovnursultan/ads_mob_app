import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'sign_in_cubit.freezed.dart';

enum SignInStatus {
  idle,
  error,
  loading;

  bool get isError => this == error;
  bool get isLoading => this == loading;
  bool get isIdle => this == idle;
}

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());

  final _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

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
      }
    }
  }

  Future googleLogin() async {
    final googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      emit(state.copyWith(status: SignInStatus.error));
      return;
    }

    final name = googleUser.displayName;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final idToken = (await userCredential.user?.getIdToken(true))!;
  }

  Future<void> signInApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      if (appleCredential.userIdentifier != null) {
        final credential = OAuthProvider('apple.com').credential(
          accessToken: appleCredential.authorizationCode,
          idToken: appleCredential.identityToken,
        );
        AppleAuthProvider.credential(appleCredential.authorizationCode);
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final idToken = await userCredential.user?.getIdToken();
        // final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
        //       pattern.allMatches(idToken!).forEach((match) => print(match.group(0)));
        final name = userCredential.user?.displayName;

        // await sendGoogelUserData(idToken!, name);
      }
    } on SignInWithAppleException {
      emit(state.copyWith(status: SignInStatus.error));
    } catch (e) {
      print(e);
    }
  }

  void signInAnonymously() async {
    await FirebaseAuth.instance.signInAnonymously();
  }
}

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(SignInStatus.idle) final SignInStatus status,
    final String? error,
  }) = _SignInState;
}
