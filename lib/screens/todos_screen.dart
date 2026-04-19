import 'package:flutter/material.dart';
import 'package:post_api/screens/detailpage.dart';

class TodosScreen extends StatelessWidget {
  final List todoList;
  const TodosScreen({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    return todoList.isEmpty
        ? Center(child: Text("Todo Not Found"))
        : ListView.separated(
            itemCount: todoList.length,
            separatorBuilder: (context, i) => SizedBox(height: 15),
            itemBuilder: (context, index) {
              final item = todoList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                },
                child: Card(
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                item.title ?? "No Title",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(29),
                                color: Theme.of(
                                  context,
                                ).colorScheme.inversePrimary,
                              ),

                              child: Icon(
                                Icons.delete_forever_outlined,
                                color: Colors.red,
                                size: 27,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          item.description ?? "No Description",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          child: Text(
                            item.isCompleted == true
                                ? "Complete"
                                : "Not Complete",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
