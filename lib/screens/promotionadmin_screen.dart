import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:homestay/screens/addpromotionadmin.dart';

class PromortionAdmin extends StatefulWidget {
  const PromortionAdmin({Key? key}) : super(key: key);

  @override
  _PromortionAdminState createState() => _PromortionAdminState();
}

class _PromortionAdminState extends State<PromortionAdmin> {
  final databaseRef = FirebaseDatabase.instance.reference().child('Promotion');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Manage Promotion"), actions: []),
        backgroundColor: Color(0xff392850),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddPromotionAdmin(),
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
                        Icons.message,
                        color: Colors.white,
                      ),
                      title: Text(
                        m['title'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(m['description'],
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
                            updateDialog(m['title'], m['description'], context,
                                snapshot.key);
                          },
                        ),
                      ]));
                })));
  }

  Future<void> updateDialog(
      String title, String desc, BuildContext context, var key) async {
    var titleController = TextEditingController(text: title);
    var descController = TextEditingController(text: desc);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Promotion"),
            content: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: "Title"),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: descController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: "Description"),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    UpdateData(titleController.text, descController.text, key);
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

  void UpdateData(String title, String desc, var key) {
    Map<String, String> x = {"title": title, "description": desc};
    databaseRef.child(key).update(x);
  }
}
