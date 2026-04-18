import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/getmodel.dart';

class ApiServices {
  // get all todos
  Future<GetAllTodoModel> getApi() async {
    try {
      final response = await http.get(
        Uri.parse("https://rest.pythonanywhere.com/api/todos/"),
      );
      if (response.statusCode == 200) {
        final data = GetAllTodoModel.fromJson(jsonDecode(response.body));
        return data;
      } else {
        throw Exception("Api Error");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }
  }

  // add todos
  Future<GetAllTodoModel> addtodos(
    String title,
    String description,
    bool isComplete,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("https://rest.pythonanywhere.com/api/todos/"),
        headers: {"Content-Type": "application/json"},
        body: (jsonEncode({
          "title": title,
          "Description": description,
          "is_Complete": isComplete,
        },)),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = GetAllTodoModel.fromJson(jsonDecode(response.body));
        return data;
      } else {
        throw Exception("Api Error");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }
  }

  // update todos
  Future<GetAllTodoModel> updatetodos(
    String id,
    String title,
    String description,
    bool isComplete,
  ) async {
    try {
      final response = await http.put(
        Uri.parse("https://rest.pythonanywhere.com/api/todos/$id/"),
        headers: {"Content-Type": "application/json"},
        body: {
          "title": title,
          "Description": description,
          "is_Complete": isComplete,
        },
      );
      if (response.statusCode == 201) {
        var data = GetAllTodoModel.fromJson(jsonDecode(response.body));

        return data;
      } else {
        throw Exception("Api Error");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // delete all todos
  Future<GetAllTodoModel> deleteApi(String id) async {
    try {
      final response = await http.delete(
        Uri.parse("https://rest.pythonanywhere.com/api/todos/$id/"),
      );
      if (response.statusCode == 200) {
        final data = GetAllTodoModel.fromJson(jsonDecode(response.body));
        return data;
      } else {
        throw Exception("Api Error");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }
}
