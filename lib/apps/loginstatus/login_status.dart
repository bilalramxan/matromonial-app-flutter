import 'package:bilal/apps/checklogin/check_login.dart';
import 'package:bilal/user/display/display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginStatus extends StatelessWidget {
  const LoginStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Display();
          } else {
            return const CheckLogin();
          }
        },
      ),
    );
  }
}
