import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/todo_model.dart';

class HomePageModel {
  static Future<List<ToDo>> getHttp(BuildContext context) async {
    var response = await Dio()
        .get('https://jsonplaceholder.typicode.com/todos?_page=1&_limit=10');
    List<dynamic> data = response.data;
    print(response.data.toString());
    if (response.statusCode! > 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "${response.statusCode}",
          style: const TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.black38,
      ));
    }
    return data.map((dynamic e) => ToDo.fromJson(e)).toList();
  }
}
