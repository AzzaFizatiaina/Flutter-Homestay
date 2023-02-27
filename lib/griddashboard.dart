import 'package:flutter/material.dart';
import 'package:homestay/screens/booking_screen.dart';
import 'package:homestay/screens/others_screen.dart';
import 'package:homestay/screens/room_screen.dart';
import 'package:homestay/screens/setting_screen.dart';

class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookingScreen()),
                );
              },
              splashColor: Color(0xffa29aac),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      size: 90.0,
                    ),
                    Text("Booking", style: new TextStyle(fontSize: 17.0))
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RoomScreen()),
                );
              },
              splashColor: Color(0xffa29aac),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      size: 90.0,
                    ),
                    Text("Facilities", style: new TextStyle(fontSize: 17.0))
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OthersScreen()),
                );
              },
              splashColor: Color(0xffa29aac),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.other_houses,
                      size: 90.0,
                    ),
                    Text("Others", style: new TextStyle(fontSize: 17.0))
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()),
                );
              },
              splashColor: Color(0xffa29aac),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      size: 90.0,
                    ),
                    Text("Setting", style: new TextStyle(fontSize: 17.0))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
