import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

   // String  backgroundImage  = data['isDayTime']? 'day.jpg': 'night.jpg';
   //Color backgroundcolor = data['isDayTime']? Colors.blue: Colors.blueGrey;
    return Scaffold(
      //backgroundColor: backgroundcolor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/day.jpg'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
               padding: const EdgeInsets.fromLTRB(0, 140.0, 0, 0),
              child: Column(
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDayTime': result['isDayTime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.lightBlueAccent[300],
                      ),
                      label: Text(
                          'Change Location',
                            style: TextStyle(
                              color: Colors.lightBlueAccent[300] ,
                            ),

                      ),
                   ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 38.0,
                            letterSpacing: 3.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ],
              ),
            ),
          ),
      )
    );
  }
}
