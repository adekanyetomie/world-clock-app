import 'package:flutter/material.dart';
import 'package:world_clock/services/world_clock.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldClock() async{
    WorldClock instance = WorldClock(location:'Lagos', flag: 'lagos.png', url: 'Africa/Lagos' );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDayTime,
    });


  }


  @override
  void initState() {
    super.initState();
    setupWorldClock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SpinKitFadingCircle(
          itemBuilder: (_, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.cyanAccent : Colors.blueGrey,
              ),
            );
          },
        ),
      )
    );
  }
}

