import 'package:bilal/admin/update/update.dart';
import 'package:bilal/apps/checklogin/check_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../apps/tost/tost_message.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  final dbShowRefrence = FirebaseDatabase.instance.ref('lovebirds');
  DatabaseReference ref = FirebaseDatabase.instance.ref('lovebirds');
  //controllers
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckLogin(),
                    ),
                  );
                  TostMessage().tostMessage("Logout Successfully!");
                }).onError((FirebaseAuthException error, stackTrace) {
                  TostMessage().tostMessage(error.message);
                });
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: Column(
        children: [
          // Text("total sum = $sum"),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: TextFormField(
              // keyboardType: TextInputType.phone,
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: dbShowRefrence,
                itemBuilder: (context, snapshot, animation, index) {
                  final names = snapshot.child('name').value.toString();
                  final genders = snapshot.child('gender').value.toString();
                  final ages = snapshot.child('age').value.toString();
                  final statuss = snapshot.child('status').value.toString();
                  final citys = snapshot.child('city').value.toString();
                  final ids = snapshot.child('id').value.toString();

                  Map cust = snapshot.value as Map;
                  cust[Key] = snapshot.key;

                  if (searchController.text.isEmpty) {
                    return Container(
                      margin: const EdgeInsets.only(
                          top: 6, left: 10, right: 12, bottom: 6),
                      // color: Colors.white,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pinkAccent,
                            blurRadius: 3.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 5  horizontally
                              2.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          SafeArea(
                            minimum: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: <Widget>[
                                // CircleAvatar(
                                //   radius: 50,
                                //   backgroundImage:
                                //       AssetImage('assets/avatar.jpg'),
                                // ),
                                Text(
                                  cust['name'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Pacifico",
                                  ),
                                ),
                                Text(
                                  cust['status'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.pink,
                                      letterSpacing: 2.5,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Source Sans Pro"),
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 200,
                                  child: Divider(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  cust['city'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pinkAccent,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Pacifico",
                                  ),
                                ),
                                Text(
                                  cust['gender'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pinkAccent,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Pacifico",
                                  ),
                                ),
                                Text(
                                  cust['age'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pinkAccent,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Pacifico",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  ref
                                      .child(
                                          snapshot.child('id').value.toString())
                                      .remove();
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Update(names,
                                          genders, ages, statuss, citys, ids),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  } else if (genders
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase())) {
                    return Container(
                      margin:
                          const EdgeInsets.only(top: 12, left: 10, right: 12),
                      // color: Colors.white,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pinkAccent,
                            blurRadius: 3.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 5  horizontally
                              2.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                padding: const EdgeInsets.all(08),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.pinkAccent,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  cust['status'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    cust['name'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${cust['gender']}  ${cust['city']}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      // fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  ref
                                      .child(
                                          snapshot.child('id').value.toString())
                                      .remove();
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Update(names,
                                          genders, ages, statuss, citys, ids),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }

                  // return Card(
                  //   child: ListTile(
                  //     onTap: () {},
                  //     // title: Text(snapshot.child("name").value.toString()),
                  //     // leading: CircleAvatar(
                  //     //   radius: 30,
                  //     //   child: FittedBox(
                  //     //     child: Text(
                  //     //       'RS. ${cust['amount'].toString()}',
                  //     //       // style: const TextStyle(
                  //     //       //   fontWeight: FontWeight.bold,
                  //     //       //   fontSize: 15,
                  //     //       // ),
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     leading: Expanded(
                  //       child: Container(
                  //         padding: const EdgeInsets.all(08.0),
                  //         decoration: BoxDecoration(
                  //           border: Border.all(width: 2, color: Colors.blue),
                  //         ),
                  //         child: Text(
                  //           'RS. ${cust['amount'].toString()}',
                  //           style: const TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 18,
                  //             color: Colors.blue,
                  //           ),
                  //         ),
                  //       ),
                  //     ),

                  //     title: Text(
                  //       cust['title'],
                  //       style: const TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     subtitle: Text(
                  //       '${cust['date']} , ${cust['time']}',
                  //     ),
                  //     trailing: IconButton(
                  //         onPressed: () {}, icon: const Icon(Icons.delete)),

                  //     // leading: const CircleAvatar(
                  //     //   child: Icon(Icons.person),
                  //     // ),
                  //   ),
                  // );
                }),
          ),
        ],
      ),
    );
  }
}
