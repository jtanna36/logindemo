import 'package:flutter/material.dart';
import 'package:logindemo/CustomExpansionTile.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  var FilterList = [
  {"title": "Administrative", "color":Colors.white, "iconColor":Colors.black},
    {"title": "Financial", "color":Colors.white, "iconColor":Colors.black},
    {"title": "Make / Model Selection", "color":Colors.white, "iconColor":Colors.black},
    {"title": "Brand", "color":Colors.white, "iconColor":Colors.black},
    {"title": "Product Specification", "color":Colors.white, "iconColor":Colors.black}
  ];

  var checkBoxdata = [
    {"value": false, "label": "ACXXEL", "total": 667},
    {"value": false, "label": "ACXXEL", "total": 395},
    {"value": false, "label": "ASUS", "total": 7},
    {"value": false, "label": "BOT", "total": 17},
    {"value": false, "label": "CYNIX", "total": 3},
    {"value": false, "label": "DELL", "total": 67},
    {"value": false, "label": "ELIMS", "total": 11},
    {"value": false, "label": "HLBS", "total": 305},
    {"value": false, "label": "HP", "total": 1441},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Demo"
        ),
      ),
      body:Container(
        color: Colors.grey[350],
        height: double.infinity,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: ListView.builder(
            itemCount: FilterList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return getDetails(index);
            },
          ),
        ),
      ),
    );
  }

  getDetails(int index) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CustomExpansionTile(
            onExpansionChanged: (val){
              if(FilterList[index]['color'] == Colors.white){
                setState(() {
                  FilterList[index]['color'] = Colors.grey;
                  FilterList[index]['iconColor'] = Colors.white;
                });
              }
              else
                {
                  setState(() {
                    FilterList[index]['color'] = Colors.white;
                    FilterList[index]['iconColor'] = Colors.black;
                  });
                }
            },
            headerBackgroundColor: FilterList[index]['color'],
            iconColor: FilterList[index]['iconColor'],
            title: getTitle(index),
            children: [getExpandableContent(FilterList[index]['title'])],
          ),
        ),
      ),
    );
  }

  getTitle(int index){
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        FilterList[index]['title'],
        style: TextStyle(color: FilterList[index]['color']== Colors.white?Colors.black:Colors.white, fontSize: 16),
      ),
    );
  }

  getExpandableContent(String title){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search $title",
                    hintStyle: TextStyle(fontSize: 14,color: Colors.grey),
                    contentPadding: EdgeInsets.all(5)),
              ),
            ),
          ),
          SizedBox(
            child: ListView.builder(
                itemCount: checkBoxdata.length,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return getCheckBox(checkBoxdata[index]['label'],
                      checkBoxdata[index]['total'], index);
                }),
          )
        ],
      ),
    );
  }

  getCheckBox(String label, int num, int index) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              checkBoxdata[index]['value'] = !checkBoxdata[index]['value'];
            });
          },
          child: Icon(
            checkBoxdata[index]['value'] == false
                ? Icons.check_box_outline_blank
                : Icons.check_box_outlined,
            color: Colors.grey[200],
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
        Spacer(),
        Text(
          "(${num.toString()})",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
