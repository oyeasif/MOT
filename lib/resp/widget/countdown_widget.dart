
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
class CountdownWidget extends StatefulWidget {
  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int secondsRemaining = 153179;

 // 1 day in seconds

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (secondsRemaining == 0) {
          timer.cancel();
        } else {
          setState(() {
            secondsRemaining--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedDays = (secondsRemaining ~/ 86400).toString().padLeft(2, '0');
    String formattedHours =
        ((secondsRemaining % 86400) ~/ 3600).toString().padLeft(2, '0');
    String formattedMinutes =
        ((secondsRemaining % 3600) ~/ 60).toString().padLeft(2, '0');
    String formattedSeconds = (secondsRemaining % 60).toString().padLeft(2, '0');

    return Row(
      children: [
        _buildTimeContainer(formattedDays),
         SizedBox(width: 3.w),
         
         const Text(":",style: TextStyle(color: MyColors.black),),
        SizedBox(width: 3.w),
        _buildTimeContainer(formattedHours),
         SizedBox(width: 5.w),
         
        const Text(":",style: TextStyle(color: MyColors.black),),
        SizedBox(width: 3.w),
        _buildTimeContainer(formattedMinutes),
         SizedBox(width: 5.w),
         
        const Text(":",style: const TextStyle(color: MyColors.black),),
        SizedBox(width: 3.w),
        _buildTimeContainer(formattedSeconds),
      ],
    );
  }

  Widget _buildTimeContainer(String time) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}