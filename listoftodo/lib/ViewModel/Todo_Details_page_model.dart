import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Model/todo_model.dart';

class TodoDetailsPageModel {
  static Future<ToDo> getHttp(int id, BuildContext context) async {
    var response = await Dio()
        .get('https://jsonplaceholder.typicode.com/todos/${id.toString()}');
    Map<String, dynamic> data = response.data;
    if (response.statusCode! > 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "${response.statusCode}",
          style: const TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.black38,
      ));
    }
    return ToDo.fromJson(data);
  }
}
