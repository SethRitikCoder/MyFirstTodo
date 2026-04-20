import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget defText({
    required String title,
    Color colour = Colors.black,
    double size = 20.0,
    FontWeight weight = FontWeight.bold,
    Color? bgcolor,
    FontStyle? style,
  }) {
    return Text(
      title,
      style: TextStyle(
        color: colour,
        fontSize: size,
        fontWeight: weight,
        backgroundColor: bgcolor,
        fontStyle: style,
      ),
    );
  }

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
        child: Container(
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
                        defText(
                          title: "Back",
                          size: 18,
                          colour: Colors.white,
                          weight: FontWeight.bold,
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
                    defText(
                      title: "Title--",
                      size: 24,
                      weight: FontWeight.w800,
                      colour: Colors.cyan,
                      bgcolor: Colors.black87,
                    ),
                    SizedBox(width: 10),

                    defText(
                      title:
                          "This is the description of the todo item. It provides more details about the task that needs to be completed.",
                      size: 24,
                      weight: FontWeight.w800,
                      colour: Colors.cyan,
                      bgcolor: Colors.black87,
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
                    defText(
                      title: "Completed--",
                      size: 30,
                      weight: FontWeight.w400,
                      colour: Colors.greenAccent,
                      bgcolor: Colors.indigoAccent.shade100,
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
                    defText(
                      title: "Description---",
                      size: 26,
                      weight: FontWeight.w900,
                      colour: Colors.pinkAccent,
                      bgcolor: Colors.deepPurpleAccent,
                    ),
                    SizedBox(width: 10),

                    defText(
                      title:
                          "This is the description of the todo item. It provides more details about the task that needs to be completed.",
                      size: 32,
                      weight: FontWeight.bold,
                      colour: const Color.fromARGB(255, 60, 255, 0),
                      bgcolor: Colors.indigo.shade900,
                      style: FontStyle.values[1],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
