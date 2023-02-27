import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:homestay/screens/promotionadmin_screen.dart';

class AddPromotionAdmin extends StatefulWidget {
  const AddPromotionAdmin({Key? key}) : super(key: key);

  @override
  _AddPromotionAdminState createState() => _AddPromotionAdminState();
}

class _AddPromotionAdminState extends State<AddPromotionAdmin> {
  var titleController = new TextEditingController();
  var descController = new TextEditingController();

  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Promotion"), actions: []),
        backgroundColor: Color(0xff392850),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Enter Promotion",
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
              controller: descController,
              decoration: InputDecoration(
                labelText: "Enter Promotion Description",
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
                  if (titleController.text.isNotEmpty &&
                      descController.text.isNotEmpty) {
                    addPromotion(titleController.text, descController.text);
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PromortionAdmin()),
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

  void addPromotion(String title, String desc) {
    String? key = databaseRef.child("Promotion").push().key;
    databaseRef.child("Promotion").child(key!).set({
      'title': title,
      'description': desc,
    });
    titleController.clear();
    descController.clear();
  }
}
