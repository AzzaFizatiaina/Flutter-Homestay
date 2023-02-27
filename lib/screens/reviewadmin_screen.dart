import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:homestay/screens/addreview_scree.dart';

class ReviewAdmin extends StatefulWidget {
  const ReviewAdmin({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewAdmin> {
  final databaseRef = FirebaseDatabase.instance.reference().child('Feedback');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Manage Feedback"), actions: []),
        backgroundColor: Color(0xff392850),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddFeedback(),
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
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        m['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(m['feedback'],
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
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            //var key = snapshot.key;
                            //print(key);
                            updateDialog(m['name'], m['feedback'], context,
                                snapshot.key);
                          },
                        ),
                      ]));
                })));
  }

  Future<void> updateDialog(
      String name, String feedback, BuildContext context, var key) async {
    var nameController = TextEditingController(text: name);
    var feedbackController = TextEditingController(text: feedback);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Feedback"),
            content: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: "Name"),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: feedbackController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: "Feedback"),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    UpdateData(
                        nameController.text, feedbackController.text, key);
                    Navigator.of(context).pop();
                  },
                  child: Text("Update")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel")),
            ],
          );
        });
  }

  void UpdateData(String name, String feedback, var key) {
    Map<String, String> x = {"name": name, "feedback": feedback};
    databaseRef.child(key).update(x);
  }
}
