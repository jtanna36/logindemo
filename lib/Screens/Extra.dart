import 'package:flutter/material.dart';
import 'package:logindemo/CustomDemo.dart';

class ExtraPage extends StatefulWidget {
  @override
  _ExtraPageState createState() => _ExtraPageState();
}

class _ExtraPageState extends State<ExtraPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _animationController2;
  AnimationController _radiusController;
  Animation simpleAnimation;
  Animation simpleAnimation2;
  Animation radiusAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 10000));
    _animationController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 10000));
    _radiusController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    simpleAnimation =
        Tween(begin: 0.0, end: 50.0).animate(_animationController);
    radiusAnimation = Tween(begin: 30.0, end: 60.0).animate(
        CurvedAnimation(curve: Curves.bounceOut, parent: _radiusController));
    simpleAnimation2 =
        Tween(begin: 0.0, end: 50.0).animate(_animationController2);

    _animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        print("finished");
        _animationController2.forward();
      }
    });

    _radiusController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _radiusController.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getD();
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          //width: double.infinity,
          child: Column(
            children: [
              /*Center(
                child: AnimatedBuilder(
                  animation: _animationController2,
                  builder: (context, child) {
                    return Container(
                      transform: Matrix4.translationValues(
                          0, simpleAnimation2.value, 0),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(80)),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 150.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return AnimatedBuilder(
                        animation: _radiusController,
                        builder: (context, child) {
                          return Container(
                            transform: Matrix4.translationValues(
                                simpleAnimation.value, 0, 0),
                            height: radiusAnimation.value,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(80)),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDemo(color: Colors.red, size: 20, title: "Demo"),
              ),*/
              Stack(
                children: [
                  ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      color: Colors.blue,
                    ),
                    clipper: CustomClipPath(),
                  ),
                  Positioned(
                    bottom: 0,
                    right: (MediaQuery.of(context).size.width/2) -50,
                    child: Container(
                      color: Colors.yellow,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void getD() {
    _animationController.forward();
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius=10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height),
        radius: Radius.elliptical(30, 10));
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}