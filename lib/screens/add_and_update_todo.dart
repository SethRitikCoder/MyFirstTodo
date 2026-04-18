import 'package:flutter/material.dart';
import 'package:post_api/api_services/api_services.dart';
import 'package:post_api/utils/comman_toast.dart';

class AddAndUpdateTodoScreen extends StatefulWidget {
  const AddAndUpdateTodoScreen({super.key});

  @override
  State<AddAndUpdateTodoScreen> createState() => _AddAndUpdateTodoScreenState();
}

class _AddAndUpdateTodoScreenState extends State<AddAndUpdateTodoScreen> {
  bool isComplete = false;
  var titleController = TextEditingController();
  var desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text('ADD TODO', style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "Title",
                //hintStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: desController,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "Description",
                // hintStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                border: InputBorder.none,
              ),
            ),

            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Complete",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
                Switch(
                  // This bool value toggles the switch.
                  value: isComplete,
                  activeThumbColor: Colors.deepPurple.shade500,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      isComplete = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            commanToast(context, "Please Enter Title");
          } else if (desController.text.isEmpty) {
            commanToast(context, "Please Enter Description");
          } else {
            ApiServices()
                .addtodos(
                  titleController.text.toString(),
                  desController.text.toString(),
                  isComplete,
                )
                .then((value) {
                  Navigator.pop(context, true);
                })
                .onError((error, stackTrace) {
                  debugPrint(error.toString());
                });
          }
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
