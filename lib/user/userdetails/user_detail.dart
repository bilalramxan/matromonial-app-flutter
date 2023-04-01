// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bilal/user/display/display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../apps/tost/tost_message.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  bool maleSelected = false;

  bool femaleSelected = false;

  late String? Inputgender;

  // final user = FirebaseAuth.instance.currentUser?.phoneNumber;
  String id = DateTime.now().microsecondsSinceEpoch.toString();
  //function to enter
  void savedetail() {
    final dbRefrence = FirebaseDatabase.instance.ref('lovebirds');
    dbRefrence.child(id).set({
      'id': id,
      'name': nameController.text.toString(),
      'age': ageController.text.toString(),
      'gender': Inputgender.toString(),
      'status': statusController.text.toString(),
      'city': cityController.text.toString(),
    }).then((value) {
      TostMessage().tostMessage("Record Added Sucessfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Display(),
        ),
      );
    }).onError((FirebaseException error, stackTrace) {
      TostMessage().tostMessage(error.message);
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  // TextEditingController genderController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  // TextEditingController religionController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
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
                          'Let\'s',
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
                          ' Register',
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
                child: TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white, fontSize: 14.5),
                  decoration: InputDecoration(
                      prefixIconConstraints: BoxConstraints(minWidth: 45),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white70,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter Fullname',
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
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                child: TextField(
                  controller: ageController,
                  style: TextStyle(color: Colors.white, fontSize: 14.5),
                  decoration: InputDecoration(
                      prefixIconConstraints: BoxConstraints(minWidth: 45),
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: Colors.white70,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter Age',
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
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                child: TextField(
                  controller: statusController,
                  style: TextStyle(color: Colors.white, fontSize: 14.5),
                  decoration: InputDecoration(
                      prefixIconConstraints: BoxConstraints(minWidth: 45),
                      prefixIcon: Icon(
                        Icons.six_ft_apart,
                        color: Colors.white70,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter Status',
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
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                child: TextField(
                  controller: cityController,
                  style: TextStyle(color: Colors.white, fontSize: 14.5),
                  decoration: InputDecoration(
                      prefixIconConstraints: BoxConstraints(minWidth: 45),
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: Colors.white70,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter City',
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
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        maleSelected = true;

                        femaleSelected = false;
                      });
                      if (maleSelected == true) {
                        Inputgender = 'boy';
                      } else {
                        Inputgender = 'girl';
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white60)),
                            child: maleSelected
                                ? Container(
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white70),
                                  )
                                : SizedBox()),
                        Text('Boy',
                            style: TextStyle(
                                color: Colors.white70, fontSize: 14.5))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        femaleSelected = true;

                        maleSelected = false;

                        if (femaleSelected == true) {
                          Inputgender = 'girl';
                        } else {
                          Inputgender = 'boy';
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white60)),
                            child: femaleSelected
                                ? Container(
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white70),
                                  )
                                : SizedBox()),
                        Text('Girl',
                            style: TextStyle(
                                color: Colors.white70, fontSize: 14.5))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  savedetail();
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
                  child: Text('Register',
                      style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
