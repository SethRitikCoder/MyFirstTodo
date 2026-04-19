import 'package:flutter/material.dart';
import 'package:post_api/api_services/api_services.dart';
import 'package:post_api/model/getmodel.dart';

import 'package:post_api/screens/add_and_update_todo.dart';
import 'package:post_api/screens/todos_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  GetAllTodoModel getAllTodoModel = GetAllTodoModel();
  List<Results> inCompleteTodo = [];
  List<Results> completeTodo = [];
  bool isLoading = false;

  Future<void> getallTodos() async {
    setState(() {
      isLoading = true;
    });
    ApiServices()
        .getApi()
        .then((value) {
          getAllTodoModel = value;
          completeTodo.clear();
          inCompleteTodo.clear();
          for (var element in value.results!) {
            if (element.isCompleted == true) {
              completeTodo.add(element);
            } else {
              inCompleteTodo.add(element);
            }
          }
          setState(() {
            isLoading = false;
          });
        })
        .onError((error, stackTrace) {
          debugPrint(error.toString());
          setState(() {
            isLoading = false;
          });
        });
  }

  @override
  void initState() {
    super.initState();
    getallTodos();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            'TODO APP',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 10),
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            tabs: [Text("All"), Text("InComplete"), Text("Complete")],
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : TabBarView(
                children: [
                  TodosScreen(todoList: getAllTodoModel.results ?? []),
                  TodosScreen(todoList: inCompleteTodo),
                  TodosScreen(todoList: completeTodo),
                ],
              ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            bool? result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddAndUpdateTodoScreen()),
            );
            if (result == true) {
              getallTodos();
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
