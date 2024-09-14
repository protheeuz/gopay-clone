import 'package:flutter/material.dart';
import 'package:myapp/routes/app_routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.mode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00ADD7),
              Color(0xFF0C95DE),
              Color(0xFF187AE6),
              Color(0xFF2F4BF4),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.36, 0.67, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 70,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/background/cloud.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
              ),
            ),
            const Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ini dia, aplikasi',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),
                  Text(
                    'GoPay',
                    style: TextStyle(
                      fontSize: 85,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/illustration/illustration.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.46,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
