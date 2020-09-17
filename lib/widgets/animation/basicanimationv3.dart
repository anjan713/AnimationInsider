import 'package:flutter/material.dart';

import 'dart:math' as math;

class BasicAnimationExtendedv3 extends StatefulWidget {
//search this url to find the tutorial

  @override
  _BasicAnimationExtendedStatev3 createState() =>
      _BasicAnimationExtendedStatev3();
}

class _BasicAnimationExtendedStatev3 extends State<BasicAnimationExtendedv3>
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
          // we have commented the below four lines because the ui is handled by animated widget instead of being handled by stateful widget
          // ..addListener(() {
          //we are adding set state to change ui for changes we are not adding anyting because already the updated values are in animate
          //   setState(() {});
          // })
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
      body: Transistion(
        child: Telegram(),
        anglechanger: animate,
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();

    super.dispose();
  }
}

class Transistion extends StatelessWidget {
  final Widget child;
  final Animation<double> anglechanger;
  Transistion({this.child, this.anglechanger});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: anglechanger,
      child: child,
      builder: (context, child) {
        return Transform.rotate(angle: anglechanger.value, child: child);
      },
    );
  }
}

class Telegram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30),
      child: Image.asset(
        'assets/images/telegram.png',
        height: 500,
        width: double.infinity,
      ),
    );
  }
}
