import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kronos/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gealac System',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              brightness: Brightness.light, primary: Color(0XFF4ba858)),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: const ColorScheme.dark(
              brightness: Brightness.dark, primary: Color(0XFFe4694a)),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.light,
        home: const LoginScreen());
  }
}
