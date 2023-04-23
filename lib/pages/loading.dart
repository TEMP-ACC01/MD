import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // void getData()async{
  //     Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  //     print(response.body);  // the body property return json string
  //     //The reason for using json decode is we don not know what type of data will be returned by api.
  //     // print(jsonDecode(response.body)['id']);   //To use this function we need to import dart.convert.
  //   Map data = jsonDecode(response.body);  // We decode json string to Map
  //   print(data);
  //   print(data['title']);  //Accessing title property of data.
  // }

  // void getTime()async{
  //     //Make request
  //   Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata'));
  //   Map data = jsonDecode(response.body);
  //   // print(data);
  //
  //   // get properties from data
  //   String datetime = data['datetime'];
  //   String offset = data['utc_offset'].substring(1,3);
  //   // print(datetime);
  //   // print(offset);
  //
  //   //Creating DataTime object by using DateTime class in dart
  //   //Reason behind doing this it will look better in date time object format.
  //   DateTime now = DateTime.parse(datetime);
  //   print(now);  //As we can see this is representing data better than below one.
  //   print(datetime);
  //   print(offset);
  //
  //   now = now.add(Duration(hours: int.parse(offset)));
  //   print(now);
  // }
String time = "loading";  //note: This time and time below are different variables.
  void  setupWorldTime()async{
    WorldTime instance = WorldTime(location: "India", flag: "India.png", url: "Asia/Kolkata");
    await instance.getTime(); //await because next function is depended on this one.
    // print(instance.time);
    // setState(() {
    //   time = instance.time; //Both time variables are different.
    // });
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(

        child:  SpinKitRing(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
