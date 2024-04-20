import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninAuth {

  Future<void> signIn() async {

    const clientId = '98976710585-bsh6h0tg2ptlfli69cqq17rl3mt8dvmt.apps.googleusercontent.com';
    const scopes = [
      'openid',
      'profile',
      'email'
    ];

    final request = GoogleSignIn(clientId: clientId, scopes: scopes);
    final response = await request.signIn();

    final authn = await response?.authentication;
    final accessToken = authn?.accessToken;

    if (accessToken == null) {
      return;
    }

    final oAuthCredential = GoogleAuthProvider.credential(accessToken: accessToken);
    await FirebaseAuth.instance.signInWithCredential(oAuthCredential);

  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }
}