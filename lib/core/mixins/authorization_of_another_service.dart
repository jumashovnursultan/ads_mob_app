import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

mixin AuthorizationOfAnotherServiceMixin {
  final _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  Future googleSignIn() async {
    final googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      // emit(state.copyWith(status: SignInStatus.error));
      return;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> appleIdSignIn() async {
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

        await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } on SignInWithAppleException {
      // emit(state.copyWith(status: SignInStatus.error));
    } catch (e) {
      print(e);
    }
  }

  void signInAnonymously() async {
    await FirebaseAuth.instance.signInAnonymously();
  }
}
