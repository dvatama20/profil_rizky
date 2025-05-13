import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/screens/tiktok_profil_screen.dart';
import 'login_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      final box = GetStorage();
      String? statusUsername = box.read('statusUsername');

      if (statusUsername == null) {
        Get.offAll(() => LoginScreen());
      } else {
        Get.off((() => TiktokProfilScreen()));
      }
    }

    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
            CircularProgressIndicator(),
            Text("Loading..."),
          ]
        ),
      )
    );
  }
}
