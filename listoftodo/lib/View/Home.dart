import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:listoftodo/View/Todo_Details.dart';
import 'package:listoftodo/ViewModel/home_page_model.dart';

import '../Model/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    HomePageModel.getHttp(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey.shade500,
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder<List<ToDo>>(
        future: HomePageModel.getHttp(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: ((context, index) {
                return TextButton(
                  onPressed: () {
                    Get.to(TodoDetailsPage(
                      id: snapshot.data![index].id,
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          snapshot.data![index].completed == true
                              ? Icon(
                                  Icons.check_box,
                                  color: Colors.blue,
                                  size: 30,
                                )
                              : SizedBox(
                                  width: 1,
                                ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 8,
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: RichText(
                                text: TextSpan(
                                  text: "Id: ${snapshot.data![index].id} \n",
                                  children: [
                                    TextSpan(
                                      text:
                                          "userId: ${snapshot.data![index].userId} \n",
                                    ),
                                    TextSpan(
                                      text:
                                          "title: ${snapshot.data![index].title} \n",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
              itemCount: snapshot.data!.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
