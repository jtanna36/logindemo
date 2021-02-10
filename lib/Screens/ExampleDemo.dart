import 'package:flutter/material.dart';

class ExampleDemo extends StatefulWidget {
  @override
  _ExampleDemoState createState() => _ExampleDemoState();
}

class _ExampleDemoState extends State<ExampleDemo> {
  TextEditingController textEditingController = new TextEditingController();
  List li = ["Rahul", "Meena", "Kevin", "Seema"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DEMO APP"
        ),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: "Search here"
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: li.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey[350],
                            height: 50,
                            child: Center(
                              child: Text(
                                li[index]
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
