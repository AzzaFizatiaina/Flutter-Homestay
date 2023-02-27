import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({Key? key}) : super(key: key);

  @override
  _PromotionScreenState createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  final databaseRef = FirebaseDatabase.instance.reference().child('Promotion');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Promotion"), actions: []),
        backgroundColor: Color(0xff392850),
        body: SafeArea(
            child: FirebaseAnimatedList(
                query: databaseRef,
                itemBuilder: (context, snapshot, animation, index) {
                  Map m = Map.from((snapshot.value ?? {}) as Map);

                  return ListTile(
                    leading: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    title: Text(
                      m['title'],
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(m['description'],
                        style: TextStyle(color: Colors.white)),
                  );
                })));
  }
}
