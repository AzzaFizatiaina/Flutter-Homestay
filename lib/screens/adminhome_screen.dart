import 'package:flutter/material.dart';
import 'package:homestay/griddashboard.dart';
import 'package:homestay/griddashboardadmin.dart';
import 'package:homestay/screens/main_screen.dart';
import 'package:homestay/screens/signinAdmin_screen.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WELCOME ADMIN"), actions: [
        IconButton(
          icon: Icon(
            Icons.logout,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
        ),
      ]),
      backgroundColor: Color(0xff392850),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Welcome Admin",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Text("Home",
                        style: TextStyle(
                            color: Color(0xffa29aac),
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GriddashboardAdmin()
        ],
      ),
    );
  }
}
