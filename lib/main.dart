import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:janmanager/presentation/pages/home_page.dart';
import 'package:janmanager/presentation/pages/signin_page.dart';
import 'firebase_options.dart';

/// メイン関数
void main() async {
  // Firebase の準備
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // アプリを動かす
  const app = MyApp();
  const scope = ProviderScope(child: app);
  runApp(scope);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            home: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size(700, 800)),
              child: const HomePage(),
            )
          );
        } else {
          return const MaterialApp(home: SigninPage(),);
        }
      }
    );
  }
}