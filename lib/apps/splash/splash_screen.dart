// import 'dart:async';

import 'dart:async';

import 'package:bilal/user/login/login_phone.dart';
import 'package:flutter/material.dart';

import 'splash_check.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashCheck splashcheck = SplashCheck();
  void islogin() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const LoginPhone(),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    splashcheck.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(70),
                child: Image.asset(
                  'images/logo.png',
                  // width: 200,
                  // height: 150,
                  // scale: 2.5,
                  fit: BoxFit.cover,
                  // opacity: const AlwaysStoppedAnimation<double>(0.8),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Love Birds",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
