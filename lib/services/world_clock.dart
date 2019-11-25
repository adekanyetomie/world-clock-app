import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';


class WorldClock{
  String location; //location name url
  String url; //location url for the api end point
  String time; // time in a location
  String date; // date in a location
  String flag; // url to flag icon
  bool isDayTime; //true/false if it's day or night time

  WorldClock({this.location, this.flag, this.url});


  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //time = now.toString();//time property set
      time = DateFormat.jm().format(now);
      //time =  DateFormat(' kk:mm  –/n dd/MM/yyyy ').format(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? true: false;
    }
    catch(e){
      print('Caught error: $e');
      time = 'could not get time data';


    }



  }
}
