import 'package:flutter/material.dart';

class RoomAdmin extends StatefulWidget {
  const RoomAdmin({Key? key}) : super(key: key);

  @override
  _RoomAdminState createState() => _RoomAdminState();
}

class _RoomAdminState extends State<RoomAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Homestay Facilities"), actions: []),
      backgroundColor: Color(0xff392850),
      body: GridView.count(crossAxisCount: 2, children: <Widget>[
        Card(
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            splashColor: Color(0xffa29aac),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/images/room3.jpg',
                    width: 1000.0,
                  ),
                  Text("Homestay view", style: new TextStyle(fontSize: 17.0))
                ],
              ),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            splashColor: Color(0xffa29aac),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/images/room1.jpg',
                    width: 200.0,
                  ),
                  Text("Living room", style: new TextStyle(fontSize: 17.0))
                ],
              ),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            splashColor: Color(0xffa29aac),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/images/room2.jpg',
                    width: 200.0,
                  ),
                  Text("Bedroom", style: new TextStyle(fontSize: 17.0))
                ],
              ),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            splashColor: Color(0xffa29aac),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/images/room4.jpg',
                    width: 200.0,
                  ),
                  Text("Private pool", style: new TextStyle(fontSize: 17.0))
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
