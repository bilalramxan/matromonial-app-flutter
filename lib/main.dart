import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'apps/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // accentColor: Colors.pink,
        primaryColor: Colors.pink,
        focusColor: Colors.pink,
      ),
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen': (context) => const SplashScreen(),
      },
    ),
  );
}
