import 'package:flutter/material.dart';
import 'package:myapp/routes/app_routes.dart';

class SplashSreen extends StatefulWidget {
  const SplashSreen({super.key});

  @override
   createState() => _SplashSreenState();
}

class _SplashSreenState extends State<SplashSreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01AED6),
      body: Center(child: Image.asset('assets/images/logo/gopay.png')),
    );
  }
}
