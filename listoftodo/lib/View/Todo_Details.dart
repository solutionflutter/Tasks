import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:listoftodo/Model/todo_model.dart';
import 'package:listoftodo/ViewModel/Todo_Details_page_model.dart';

class TodoDetailsPage extends StatefulWidget {
  final int? id;
  const TodoDetailsPage({super.key, this.id});

  @override
  State<TodoDetailsPage> createState() => _TodoDetailsPageState();
}

class _TodoDetailsPageState extends State<TodoDetailsPage> {
  @override
  void initState() {
    super.initState();
    TodoDetailsPageModel.getHttp(widget.id!, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade500,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/home');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black38,
            size: 20,
          ),
        ),
        title: const Text(
          "ToDo Details Page",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder<ToDo>(
          future: TodoDetailsPageModel.getHttp(widget.id!, context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("User Id : ${snapshot.data!.userId}"),
                      Text("Id : ${snapshot.data!.id}"),
                      Text(
                        "title : ${snapshot.data!.title}",
                        textAlign: TextAlign.center,
                      ),
                      Text("completed : ${snapshot.data!.completed}"),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
