import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:homestay/screens/review_screen.dart';
import 'package:homestay/screens/reviewadmin_screen.dart';

class AddFeedback extends StatefulWidget {
  const AddFeedback({Key? key}) : super(key: key);

  @override
  _AddFeedbackState createState() => _AddFeedbackState();
}

class _AddFeedbackState extends State<AddFeedback> {
  var nameController = new TextEditingController();
  var feedbackController = new TextEditingController();

  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Feedback"), actions: []),
        backgroundColor: Color(0xff392850),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
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
              controller: feedbackController,
              decoration: InputDecoration(
                labelText: "Enter Feedback",
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
            Center(
              child: GestureDetector(
                onTap: () {
                  if (nameController.text.isNotEmpty &&
                      feedbackController.text.isNotEmpty) {
                    addPromotion(nameController.text, feedbackController.text);
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReviewAdmin()),
                  );
                },
                child: Container(
                  height: 50,
                  width: 280,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            )
          ],
        )));
  }

  void addPromotion(String name, String feedback) {
    String? key = databaseRef.child("Feedback").push().key;
    databaseRef.child("Feedback").child(key!).set({
      'name': name,
      'feedback': feedback,
    });
    nameController.clear();
    feedbackController.clear();
  }
}
