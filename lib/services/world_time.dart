import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  //Instead of late '?' can be use.
  late String location; // location name for the UI.
  late String time;    // the time in that location.
  late String flag;   // url to an asset flag icon.
  late String url;   // location url for api end point.
  late bool isDaytime;


  WorldTime({ required this.location, required this.flag, required this.url});

Future<void> getTime()async{   //Using Future because function will be temporarily return something but when function ends it will return void means nothing.
  //So here future is used as temporarily placeholder value.

  try {
    //Make request
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //Creating DataTime object by using DateTime class in dart
    //Reason behind doing this it will look better in date time object format.
    DateTime now = DateTime.parse(datetime);

    now = now.add(Duration(hours: int.parse(offset)));
    //set the time property
    // time = now.toString();
    isDaytime = now.hour >6 && now.hour<18 ? true : false;
    time = DateFormat.jm().format(now); //this DateFormat.jm().format is provided by intl package.
  }
  catch(e){
     print('caught error: $e');
     time = 'could not get time data';
  }

}
}

// How to use above class in code

WorldTime instance = WorldTime(location: 'India', flag: 'India.png', url: 'Asia/Kolkata');

