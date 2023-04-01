// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../display/display.dart';
import '../../apps/tost/tost_message.dart';

class Update extends StatefulWidget {
  final String name;
  final String gender;
  final String age;
  final String status;
  final String city;
  final String id;

  const Update(
      this.name, this.gender, this.age, this.status, this.city, this.id,
      {super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  // TextEditingController religionController = TextEditingController();

  String? id;
  // variables
  final dbShowRefrence = FirebaseDatabase.instance.ref('lovebirds');
  DatabaseReference ref = FirebaseDatabase.instance.ref('lovebirds');

  @override
  void initState() {
    nameController.text = widget.name;
    ageController.text = widget.age;
    genderController.text = widget.gender;
    statusController.text = widget.status;
    cityController.text = widget.city;
    id = widget.id;
    super.initState();
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Details'),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DisplayData()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios)),
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
                          'Update',
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
                          ' Data!',
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
              Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30)
                          .copyWith(bottom: 10),
                      child: TextFormField(
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
                            hintStyle: TextStyle(
                                color: Colors.white60, fontSize: 14.5),
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
                      padding: EdgeInsets.symmetric(horizontal: 30)
                          .copyWith(bottom: 10),
                      child: TextFormField(
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
                            hintStyle: TextStyle(
                                color: Colors.white60, fontSize: 14.5),
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
                      padding: EdgeInsets.symmetric(horizontal: 30)
                          .copyWith(bottom: 10),
                      child: TextFormField(
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
                            hintStyle: TextStyle(
                                color: Colors.white60, fontSize: 14.5),
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
                      padding: EdgeInsets.symmetric(horizontal: 30)
                          .copyWith(bottom: 10),
                      child: TextFormField(
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
                            hintStyle: TextStyle(
                                color: Colors.white60, fontSize: 14.5),
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
                      padding: EdgeInsets.symmetric(horizontal: 30)
                          .copyWith(bottom: 10),
                      child: TextFormField(
                        controller: genderController,
                        style: TextStyle(color: Colors.white, fontSize: 14.5),
                        decoration: InputDecoration(
                            prefixIconConstraints: BoxConstraints(minWidth: 45),
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Colors.white70,
                              size: 22,
                            ),
                            border: InputBorder.none,
                            hintText: 'Enter Gender',
                            hintStyle: TextStyle(
                                color: Colors.white60, fontSize: 14.5),
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
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    ref.child(id!).update({
                      'name': nameController.text.toString(),
                      'age': ageController.text.toString(),
                      'gender': genderController.text.toString(),
                      'status': statusController.text.toString(),
                      'city': cityController.text.toString(),
                    }).then((value) {
                      TostMessage().tostMessage("Record update Sucessfully");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DisplayData(),
                        ),
                      );
                    });
                  }
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
