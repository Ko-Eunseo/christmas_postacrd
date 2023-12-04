import 'package:christmas_postcard/providers/auth/auth_state.dart';
import 'package:christmas_postcard/view/pages/login_page.dart';
import 'package:christmas_postcard/view/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authStatus = context.watch<AuthState>().authStatus;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => authStatus == AuthStatus.authenticated
                ? const MainPage()
                : const LoginPage(),
          ),
          (route) => route.isFirst);
    });
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
