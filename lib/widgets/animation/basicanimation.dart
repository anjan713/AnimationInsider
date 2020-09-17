import 'package:flutter/material.dart';
import 'dart:math' as math;

class BasicAnimation extends StatefulWidget {
//search this url to find the tutorial

  @override
  _BasicAnimationState createState() => _BasicAnimationState();
}

class _BasicAnimationState extends State<BasicAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animate;
  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    //curved animation takes care of adding complex animation these are all extends animation<double>
    final curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeOut);

    animate = Tween<double>(begin: 0, end: 2 * math.pi)
        // we can use chain to add other tween we use curve tween it adds only single curve animation
        // .chain(CurveTween(curve: Curves.bounceIn))
        .animate(curvedAnimation)
          ..addListener(() {
            //we are adding set state to change ui for changes we are not adding anyting because already the updated values are in animate
            setState(() {});
          })
          ..addStatusListener((status) {
            //we have added this so the animation stays in infinite loop
            if (status == AnimationStatus.completed) {
              animController.reverse();
            }
            if (status == AnimationStatus.dismissed) {
              animController.forward();
            }
          });

    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
        angle: animate.value,
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Image.asset(
              'assets/images/telegram.png',
              height: 500,
              width: double.infinity,
            )),
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
