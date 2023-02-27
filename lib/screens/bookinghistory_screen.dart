import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:homestay/models/booking_data.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  _BookingHistoryState createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  final databaseRef = FirebaseDatabase.instance.reference().child('Booking');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking History"), actions: []),
      backgroundColor: Color(0xff392850),
      body: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (context, snapshot, animation, index) {
            Map m = Map.from((snapshot.value ?? {}) as Map);
            return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "IMAZMIM HOMESTAY",
                      style: TextStyle(fontSize: 23),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Homestay Details",
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text("COST", style: TextStyle(fontSize: 15)),
                          SizedBox(
                            width: 190,
                          ),
                          Text("RM 300 per days",
                              style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "BOOKING DETAILS",
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text("Name", style: TextStyle(fontSize: 15)),
                          SizedBox(
                            width: 200,
                          ),
                          Text(m['name'], style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text("Start Date", style: TextStyle(fontSize: 15)),
                          SizedBox(
                            width: 165,
                          ),
                          Text(m['Startdate'], style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text("End Date", style: TextStyle(fontSize: 15)),
                          SizedBox(
                            width: 150,
                          ),
                          Text(m['Enddate'], style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ));
          }),
    );
  }
}
