import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:janmanager/presentation/router/router.dart';
import 'firebase_options.dart';

/// メイン関数
void main() async {
  // Firebase の準備
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // アプリを動かす
  const app = AppWidget();
  const scope = ProviderScope(child: app);
  runApp(scope);
}