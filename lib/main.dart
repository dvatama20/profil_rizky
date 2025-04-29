import 'package:flutter/material.dart';
import 'package:myapp/ganti_tema.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TemaNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Provider.of<TemaNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: tema.isDarkMode ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor:
        tema.isDarkMode ? Colors.black : Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}
