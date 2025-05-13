import 'package:flutter/material.dart';
import 'package:myapp/ganti_tema.dart';
// import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
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

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: tema.isDarkMode ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor:
        tema.isDarkMode ? Colors.black : Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}
