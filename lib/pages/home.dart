import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  Object ? parameter;
  @override
  Widget build(BuildContext context) {

     // parameter = ModalRoute.of(context)?.settings.arguments;
     // data = jsonDecode(jsonEncode(parameter));
    data = data.isNotEmpty ? data: ModalRoute.of(context)?.settings.arguments as Map;  //Above tw statements are alternative for this statement.
    String location = data['location'];
    print(data);


    //set background

    String bgImage = data['isDaytime']? 'day.png':'night.png';
    Color? bgColor = data['isDaytime']? Colors.blue: Colors.indigo[700];
    return Scaffold(
 backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: [
                  TextButton.icon(onPressed: () async {
               dynamic result = await  Navigator.pushNamed(context, '/location');
               setState(() {
                 data = {
                   'time':result['time'],
                   'location':result['location'],
                   'isDaytime':result['isDaytime'],
                   'flag':result['flag']

                 };
               });
                  }
                      , icon: Icon(
                      Icons.edit_location,
                      size: 30,
                      // color: Colors.grey[800],
                    ),
                    label: Text('Edit Location',
                      style: TextStyle(
                        color: Colors.grey[300],
                          fontSize:20,

                      ),
                    ),
                    style: TextButton.styleFrom(   //Same things can be done using buttonStyle
                      foregroundColor: Colors.grey
                    ),

                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
