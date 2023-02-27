import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:homestay/screens/addreview_scree.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final databaseRef = FirebaseDatabase.instance.reference().child('Feedback');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Feedback"), actions: []),
        backgroundColor: Color(0xff392850),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddFeedback(),
                ),
              );
            },
            child: Icon(
              Icons.add,
            )),
        body: SafeArea(
            child: FirebaseAnimatedList(
                query: databaseRef,
                itemBuilder: (context, snapshot, animation, index) {
                  Map m = Map.from((snapshot.value ?? {}) as Map);

                  return ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      m['name'],
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(m['feedback'],
                        style: TextStyle(color: Colors.white)),
                  );
                })));
  }
}
