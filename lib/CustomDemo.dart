import 'package:flutter/cupertino.dart';

class CustomDemo extends StatefulWidget {
  Color color;
  double size;
  String title;
  CustomDemo({this.color,this.size, @required this.title});
  @override
  _CustomDemoState createState() => _CustomDemoState();
}

class _CustomDemoState extends State<CustomDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: widget.size
          ),
        ),
      ),
    );
  }
}
