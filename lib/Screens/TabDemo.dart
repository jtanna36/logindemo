import 'package:flutter/material.dart';

class TabDemo extends StatefulWidget{
  @override
  _TabDemoState createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> with TickerProviderStateMixin{
  TabController _tabController;
  var index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TabBar Demo"
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Container(
                child: TabBar(
                  unselectedLabelColor: Colors.red,
                  labelColor: Colors.blue,
                  labelPadding: EdgeInsets.all(8),
                  controller: _tabController,
                  tabs: [
                    Container(
                      child: Text(
                        "Tab 1"
                      ),
                    ),
                    Container(
                      child: Text(
                          "Tab 2"
                      ),
                    )
                  ],
                  onTap: (val){
                    setState(() {
                      index = val;
                    });
                  },
                ),
              ),
              Container(
                height: 200,
                child: index == 0 ? Container(
                  child: Center(
                    child: Text(
                      "Tab 1 loaded"
                    ),
                  ),
                ) : Container(
                  child: Center(
                    child: Text(
                        "Tab 2 loaded"
                    ),
                  ),
                ),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
