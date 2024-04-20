import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_login/twitter_login.dart';

class TwitterSignInAuth {

  Future<void> signIn() async {

    const apiKey = 'xYF2zh0i7e0zlgyMPvhZAqtGa';
    const apiSecretKey = 'JSKlaaGmQTzzoxJEVt19OpEQ79DxrVGCeuSkCEIWLwpmPbTqv7';
    const redirectURI = 'janma://';

    final twitterSignIn = TwitterLogin(
      apiKey: apiKey, 
      apiSecretKey: apiSecretKey, 
      redirectURI: redirectURI
    );

    final authResult = await twitterSignIn.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        // success
        final credential = TwitterAuthProvider.credential(
          accessToken: authResult.authToken!,
          secret: authResult.authTokenSecret!,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        break;
      case TwitterLoginStatus.cancelledByUser:
        // cancel
        break;
      case TwitterLoginStatus.error:
        // error
        break;
      case null:
    }
  }
}