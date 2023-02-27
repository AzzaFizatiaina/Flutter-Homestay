import 'package:flutter/material.dart';
import 'package:homestay/screens/bookinghistory_screen.dart';
import 'package:homestay/screens/promotion_screen.dart';
import 'package:homestay/screens/review_screen.dart';

class OthersScreen extends StatefulWidget {
  const OthersScreen({Key? key}) : super(key: key);

  @override
  _OthersScreenState createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Others"), actions: []),
        backgroundColor: Color(0xff392850),
        body: ListView(
          children: [
            ListTile(
              title: Text(
                'History',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'See your booking history here',
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
                      builder: (context) => const BookingHistory()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Promotion',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'See our promotion here',
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
                      builder: (context) => const PromotionScreen()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Feedback',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'See our review and give your feedback',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReviewScreen()),
                );
              },
            ),
          ],
        ));
  }
}
