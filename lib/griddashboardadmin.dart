import 'package:flutter/material.dart';
import 'package:homestay/screens/bookingadmin_screen.dart';
import 'package:homestay/screens/othersadmin_screen.dart';
import 'package:homestay/screens/roomadmin_screen.dart';
import 'package:homestay/screens/settingadmin_screen.dart';

class GriddashboardAdmin extends StatefulWidget {
  const GriddashboardAdmin({Key? key}) : super(key: key);

  @override
  _GriddashboardAdminState createState() => _GriddashboardAdminState();
}

class _GriddashboardAdminState extends State<GriddashboardAdmin> {
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
                  MaterialPageRoute(builder: (context) => const BookingAdmin()),
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
                    Text("Manage Booking", style: new TextStyle(fontSize: 17.0))
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
                  MaterialPageRoute(builder: (context) => const RoomAdmin()),
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
                    Text("Manage Facilities",
                        style: new TextStyle(fontSize: 17.0))
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
                  MaterialPageRoute(builder: (context) => const OthersAdmin()),
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
                    Text("Manage Others", style: new TextStyle(fontSize: 17.0))
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
                  MaterialPageRoute(builder: (context) => const SettingAdmin()),
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
