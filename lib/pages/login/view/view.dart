import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hj_frontend/pages/home/view/view.dart';

class LoginView extends StatefulWidget {
  static String route = "/login";
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow
  ];
  int index = 1;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        bottomColor = Colors.blue;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.black26,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: ClipPath(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  clipper: MyCustomClipper(PosTriangle.topLeft),
                  child: ScaleTransition(
                    scale: _animation,
                    child: AnimatedContainer(
                      width: 150,
                      height: 150,
                      duration: Duration(seconds: 2),
                      onEnd: () {
                        setState(() {
                          // animate the color
                          index += 1;
                          if (index >= colorList.length) {
                            index = 1;
                          }
                          bottomColor = colorList[index];
                          topColor = colorList[index - 1];

                          //// animate the alignment
                          // begin = alignmentList[index % alignmentList.length];
                          // end = alignmentList[(index + 2) % alignmentList.length];
                        });
                      },
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [bottomColor, topColor])),
                    ),
                  ),
                )),
            Positioned(
                top: 0,
                right: 0,
                child: ClipPath(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  clipper: MyCustomClipper(PosTriangle.topRight),
                  child: ScaleTransition(
                    scale: _animation,
                    child: AnimatedContainer(
                      width: 150,
                      height: 150,
                      duration: Duration(seconds: 2),
                      onEnd: () {
                        setState(() {
                          if (index >= colorList.length) {
                            index = 1;
                          }
                          bottomColor = colorList[index];
                          topColor = colorList[index - 1];

                          //// animate the alignment
                          // begin = alignmentList[index % alignmentList.length];
                          // end = alignmentList[(index + 2) % alignmentList.length];
                        });
                      },
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [bottomColor, topColor])),
                    ),
                  ),
                )),
            Positioned(
                bottom: 0,
                left: 0,
                child: ClipPath(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  clipper: MyCustomClipper(PosTriangle.bottomLeft),
                  child: ScaleTransition(
                    scale: _animation,
                    child: AnimatedContainer(
                      width: 150,
                      height: 150,
                      duration: Duration(seconds: 2),
                      onEnd: () {
                        setState(() {
                          if (index >= colorList.length) {
                            index = 1;
                          }
                          bottomColor = colorList[index];
                          topColor = colorList[index - 1];

                          //// animate the alignment
                          // begin = alignmentList[index % alignmentList.length];
                          // end = alignmentList[(index + 2) % alignmentList.length];
                        });
                      },
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [bottomColor, topColor])),
                    ),
                  ),
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: ClipPath(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  clipper: MyCustomClipper(PosTriangle.bottomRight),
                  child: ScaleTransition(
                    scale: _animation,
                    child: AnimatedContainer(
                      width: 150,
                      height: 150,
                      duration: Duration(seconds: 2),
                      onEnd: () {
                        setState(() {
                          if (index > colorList.length) {
                            index = 1;
                          }
                          bottomColor = colorList[index];
                          topColor = colorList[index - 1];

                          //// animate the alignment
                          // begin = alignmentList[index % alignmentList.length];
                          // end = alignmentList[(index + 2) % alignmentList.length];
                        });
                      },
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [bottomColor, topColor])),
                    ),
                  ),
                )),
            Center(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: ScaleTransition(
                    scale: _animation, child: Center(child: Form())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Sign in",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email))),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Passowrd",
                  prefixIcon: Icon(Icons.password)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {}, child: const Text("Forgot password?")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(HomeView.route);
                },
                child: const Text(
                  "Sign in",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}

enum PosTriangle { topLeft, bottomLeft, topRight, bottomRight }

class MyCustomClipper extends CustomClipper<Path> {
  PosTriangle direction;
  MyCustomClipper(this.direction);
  @override
  Path getClip(Size size) {
    var path = Path();
    switch (direction) {
      case PosTriangle.topLeft:
        path.lineTo(size.width, 0);
        path.lineTo(0, size.width);
        break;
      case PosTriangle.bottomLeft:
        path.lineTo(size.width, size.height);
        path.lineTo(0, size.width);
        break;
      case PosTriangle.topRight:
        path.lineTo(size.width, 0);
        path.lineTo(size.width, size.height);
        break;
      case PosTriangle.bottomRight:
        path.moveTo(size.width, size.height);
        path.lineTo(0, size.height);
        path.lineTo(size.height, 0);
        break;
      default:
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
