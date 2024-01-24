import 'dart:async';
import 'package:flutter/material.dart';

import '../../constants/layout_constant.dart';

class TimerWidget extends StatefulWidget {
  late final double totalTime;
  TimerWidget({required this.totalTime});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
    int start = 5;
    // ignore: unused_element
    void _startTimer() {
      Timer.run(() {
        setState(() {
          if (widget.totalTime > 0) {
            //widget.order--;
            start--;
          } else {
            // timer.cancel();
          }
        });
      });
    }

    Size size = MediaQuery.of(context).size;
    return Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        height: size.height * 0.27,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(/*widget.order*/ start > 0
                    ? 'assets/images/random/timer1.png'
                    : 'assets/images/random/timer.png'),
                fit: BoxFit.cover)),
      ),
      Text(
        start.toString(),
        //widget.order.toString(),
        style: resTitleS,
      ),
    ]);
  }
}
