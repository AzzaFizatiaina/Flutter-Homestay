import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:homestay/reusable_widgets/reusable_widget.dart';
import 'package:homestay/screens/bookingstatus_screen.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _dateTime = DateTime.now();

  var nameController = new TextEditingController();
  var startController = new TextEditingController();
  var endController = new TextEditingController();

  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Book Now"), actions: []),
        backgroundColor: Color(0xff392850),
        body: SafeArea(
            child: Column(
          children: [
            Text(
              "Book Now",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white70,
                ),
                labelText: "Enter Name",
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white.withOpacity(0.3),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: startController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.white70,
                ),
                labelText: "Enter Start Date",
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white.withOpacity(0.3),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none)),
              ),
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate:
                            _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2023))
                    .then((date) {
                  setState(() {
                    _dateTime = date!;
                  });
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: endController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.white70,
                ),
                labelText: "Enter End Date",
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white.withOpacity(0.3),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none)),
              ),
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate:
                            _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2023))
                    .then((date) {
                  setState(() {
                    _dateTime = date!;
                  });
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  if (nameController.text.isNotEmpty &&
                      startController.text.isNotEmpty &&
                      endController.text.isNotEmpty) {
                    addBooking(nameController.text, startController.text,
                        endController.text);
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookingStatus()),
                  );
                },
                child: Container(
                  height: 50,
                  width: 280,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Book',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            )
          ],
        )));
  }

  void addBooking(String name, String startDate, String endDate) {
    String? key = databaseRef.child("Booking").push().key;
    databaseRef.child("Booking").child(key!).set({
      'name': name,
      'Startdate': startDate,
      'Enddate': endDate,
    });
    nameController.clear();
    startController.clear();
    endController.clear();
  }
}
