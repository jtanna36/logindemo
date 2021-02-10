import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logindemo/Screens/SampleDemo.dart';
import 'package:logindemo/models/ListSampleResponse.dart';
import 'package:logindemo/models/SampleResponse.dart';

class SampleDemo2 extends StatefulWidget {
  @override
  _SampleDemo2State createState() => _SampleDemo2State();
}

class _SampleDemo2State extends State<SampleDemo2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Demo 2"
        ),
      ),
      body: Container(
        child: Column(
          children: [
            MaterialButton(
                child: Text(
                  "Press here"
                ),
                color: Colors.orange,
                onPressed: (){
                  getDetails();
                }
            ),
            FutureBuilder<List<ListSampleResponse>>(
              future: getDetails(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return Container(
                    child: Text(
                      snapshot.data[0].title
                    ),
                  );
                }
                else
                  {
                    return CircularProgressIndicator();
                  }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<ListSampleResponse>>getDetails() async {
    var response = await Dio().get("https://jsonplaceholder.typicode.com/posts");
    List<ListSampleResponse> li = (response.data as List).map((e) => ListSampleResponse.fromJson(e)).toList();
    return li;

  }
}
