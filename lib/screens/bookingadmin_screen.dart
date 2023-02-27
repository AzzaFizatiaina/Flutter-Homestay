import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:homestay/screens/booking_screen.dart';

class BookingAdmin extends StatefulWidget {
  const BookingAdmin({Key? key}) : super(key: key);

  @override
  _BookingAdminState createState() => _BookingAdminState();
}

class _BookingAdminState extends State<BookingAdmin> {
  final databaseRef = FirebaseDatabase.instance.reference().child('Booking');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Manage Booking"), actions: []),
        backgroundColor: Color(0xff392850),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookingScreen(),
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
                        Icons.bookmark,
                        color: Colors.white,
                      ),
                      title: Text(
                        m['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                          m['Startdate'] + "\t" + "to" + "\t" + m['Enddate'],
                          style: TextStyle(color: Colors.white)),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            databaseRef.child(snapshot.key!).remove();
                          },
                        ),
                      ]));
                })));
  }
}
