import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logindemo/Screens/SampleDemo2.dart';
import 'package:logindemo/models/SampleResponse.dart';

class SampleDemo extends StatefulWidget {
  @override
  _SampleDemoState createState() => _SampleDemoState();
}

class _SampleDemoState extends State<SampleDemo> {
  List<SampleResponse> list1 = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sample Demo"
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaterialButton(
                child: Text(
                  "Press here"
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SampleDemo2()));
                },
                color: Colors.orange,
              ),
              SizedBox(
                height: 20,
              ),
              /*FutureBuilder<SampleResponse>(
                  future: getData(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return Text(
                        snapshot.data.results[0]
                      );
                    }
                    else
                      {
                        return CircularProgressIndicator();
                      }
                  }
              )*/
            ],
          ),
        ),
      ),
    );
  }
}

Future<SampleResponse> getData() async {
  SampleResponse sampleResponse = new SampleResponse();
  var response = await Dio().get("https://randomuser.me/api/?results=50");
  if(response.statusCode == 200){
    return SampleResponse.fromJson(response.data);
  }
}


