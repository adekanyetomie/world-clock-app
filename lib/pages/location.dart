import 'package:flutter/material.dart';
import 'package:world_clock/services/world_clock.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldClock> locations = [
    WorldClock(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldClock(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldClock(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldClock(url: 'Africa/Accra', location: 'Accra', flag: 'ghana.png'),
    WorldClock(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'sa.png'),
    WorldClock(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
    WorldClock(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldClock(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldClock(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldClock(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldClock(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldClock instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
