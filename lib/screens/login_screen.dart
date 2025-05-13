import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ganti_tema.dart';
import 'tiktok_profil_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  void _togglePasswordVisibility(BuildContext context) {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
    Provider.of<TemaNotifier>(context, listen: false).toggleTheme(); // Ubah tema juga
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (_) => const TiktokProfilScreen()),
      // );
      Get.to(() => TiktokProfilScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    final tema = Provider.of<TemaNotifier>(context);
    final isDarkMode = tema.isDarkMode;

    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final labelColor = isDarkMode ? Colors.white70 : Colors.black54;
    final borderColor = isDarkMode ? Colors.white38 : Colors.black38;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: usernameController,
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(color: labelColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: textColor),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: labelColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: textColor),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: labelColor,
                      ),
                      onPressed: () => _togglePasswordVisibility(context),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
