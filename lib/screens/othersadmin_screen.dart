import 'package:flutter/material.dart';
import 'package:homestay/screens/promotionadmin_screen.dart';
import 'package:homestay/screens/review_screen.dart';
import 'package:homestay/screens/reviewadmin_screen.dart';

class OthersAdmin extends StatefulWidget {
  const OthersAdmin({Key? key}) : super(key: key);

  @override
  _OthersAdminState createState() => _OthersAdminState();
}

class _OthersAdminState extends State<OthersAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Manage Others"), actions: []),
        backgroundColor: Color(0xff392850),
        body: ListView(
          children: [
            ListTile(
              title: Text(
                'Promotion',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Manage promotion',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PromortionAdmin()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Review',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Manage review',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReviewAdmin()),
                );
              },
            ),
          ],
        ));
  }
}
