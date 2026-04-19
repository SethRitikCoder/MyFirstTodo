import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Page",
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [Icon(Icons.details_outlined)],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              
              backgroundColor: Colors.deepPurpleAccent,
              child: Icon(
                Icons.description_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 40,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Back",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.arrow_back, size: 20, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Title--",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.cyan,
                      backgroundColor: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "This is the description of the todo item. It provides more details about the task that needs to be completed.",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrangeAccent.shade400,
                      backgroundColor: Colors.indigo.shade100,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Completed--",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.greenAccent,
                      backgroundColor: Colors.indigoAccent.shade100,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "This is the description of the todo item. It provides more details about the task that needs to be completed.",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrangeAccent.shade400,
                      backgroundColor: Colors.indigo.shade100,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Description--",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.pinkAccent,
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "This is the description of the todo item. It provides more details about the task that needs to be completed.",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 60, 255, 0),
                      backgroundColor: Colors.indigo.shade900,
                      fontStyle: FontStyle.values[1],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
