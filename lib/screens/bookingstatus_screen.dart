import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:homestay/screens/home_screen.dart';

class BookingStatus extends StatefulWidget {
  const BookingStatus({Key? key}) : super(key: key);

  @override
  _BookingStatusState createState() => _BookingStatusState();
}

class _BookingStatusState extends State<BookingStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Booking Status"), actions: []),
        backgroundColor: Color(0xff392850),
        body: Column(children: [
          SizedBox(
            height: 200,
          ),
          Center(
            child: Icon(
              Icons.celebration_outlined,
              size: 90,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Thank You For Your Booking!",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Your Booking Was Completed Successfully.",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            height: 24,
          ),
          Center(
            child: FlatButton(
              color: Colors.black,
              height: 50,
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          )
        ]));
  }
}
