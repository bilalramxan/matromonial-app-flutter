import 'package:bilal/admin/display/display.dart';
import 'package:bilal/apps/checklogin/check_login.dart';
import 'package:bilal/apps/tost/tost_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    auth
        .signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      TostMessage().tostMessage("Login Sucessfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DisplayData(),
        ),
      );
    }).onError((FirebaseAuthException error, stackTrace) {
      TostMessage().tostMessage(error.message);
    });
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Login Page"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckLogin(),
                ),
                (route) => false);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pink.shade200, Colors.pink.shade900])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.pink.shade100, Colors.pink.shade900]),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            spreadRadius: 3,
                            color: Colors.black12)
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200),
                          bottomRight: Radius.circular(200))),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25, left: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hi!',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    color: Colors.black45,
                                    offset: Offset(1, 1),
                                    blurRadius: 5)
                              ]),
                        ),
                        Text(
                          ' Admin',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink.shade600,
                              shadows: [
                                Shadow(
                                    color: Colors.black45,
                                    offset: Offset(1, 1),
                                    blurRadius: 5)
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                child: TextFormField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white, fontSize: 14.5),
                  decoration: InputDecoration(
                      prefixIconConstraints: BoxConstraints(minWidth: 45),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white70,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter Email',
                      hintStyle:
                          TextStyle(color: Colors.white60, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)
                              .copyWith(bottomRight: Radius.circular(0)),
                          borderSide: BorderSide(color: Colors.white38)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)
                              .copyWith(bottomRight: Radius.circular(0)),
                          borderSide: BorderSide(color: Colors.white70))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Email';
                    } else if (!EmailValidator.validate(value)) {
                      return 'Enter Correct Email !';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                child: TextFormField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.white, fontSize: 14.5),
                  obscureText: isPasswordVisible ? false : true,
                  decoration: InputDecoration(
                      prefixIconConstraints: BoxConstraints(minWidth: 45),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white70,
                        size: 22,
                      ),
                      suffixIconConstraints:
                          BoxConstraints(minWidth: 45, maxWidth: 46),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white70,
                          size: 22,
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                      hintStyle:
                          TextStyle(color: Colors.white60, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)
                              .copyWith(bottomRight: Radius.circular(0)),
                          borderSide: BorderSide(color: Colors.white38)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)
                              .copyWith(bottomRight: Radius.circular(0)),
                          borderSide: BorderSide(color: Colors.white70))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Password';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  login();
                },
                child: Container(
                  height: 53,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12.withOpacity(.2),
                            offset: Offset(2, 2))
                      ],
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: Radius.circular(0)),
                      gradient: LinearGradient(colors: [
                        Colors.pink.shade200,
                        Colors.pink.shade900
                      ])),
                  child: Text('Signup',
                      style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
