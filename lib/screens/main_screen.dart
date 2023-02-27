import 'package:flutter/material.dart';
import 'package:homestay/reusable_widgets/reusable_widget.dart';
import 'package:homestay/screens/signinAdmin_screen.dart';
import 'package:homestay/screens/signin_screen.dart';
import 'package:homestay/utils/color_utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                    child: Column(children: <Widget>[
                      logoWidget("assets/images/logo1.png"),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          child: Text(
                            'Admin',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInAdmin()),
                            );
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          child: Text(
                            'Customer',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()),
                            );
                          }),
                    ])))));
  }
}
