

import 'package:flutter/material.dart';

import '../services/world_time.dart';
// import 'package:world_time/services/world_time.dart';  //Alternative

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  
  // // void getData()async{
  // //   await Future.delayed(Duration(seconds:3),(){
  // //     //Simulate network request from userName.
  // //     print("ABC");
  // //   });
  // //   //Simulate network request for user bio
  // //   // Now think of this as app we cannot directly print or return bio we first need user name so we will have to wait for above function which give user name so we will make above function await to use await keyword we have to make our original function async.
  // //   Future.delayed(Duration(seconds: 2),(){
  // //     print("Musician, Mathematician, cook");
  // //   });
  // //   print("Statement");
  // // }
  //
  // //How above code can be used in app here we are just making dummy code we donnot actually have database.
  // void getData()async{
  //  String username =  await Future.delayed(Duration(seconds:3),(){
  //         //Simulate network request from userName.
  //         return("ABC");
  //       });
  //       //Simulate network request for user bio
  //       // Now think of this as app we cannot directly print or return bio we first need user name so we will have to wait for above function which give user name so we will make above function await to use await keyword we have to make our original function async.
  //  String bio = await Future.delayed(Duration(seconds: 2),(){
  //         return "Musician, Mathematician, cook";
  //       });
  //  print('$username-$bio');
  //
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print("instate function ran");
  //   getData();
  //   print("The above function is non Blocking code so even this statement comming after that code this is executing before that");
  // }
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
  ];

  void updateTime(index)async{
 WorldTime instance = locations[index];
 await instance.getTime();
 //Navigate to home screen
    //Here we will use pop function as home screen is already underneath this page.
    Navigator.pop(context,{        //No need to write argumenrts word while poping.
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });

  }
  @override
  Widget build(BuildContext context) {
    // print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('ChooseLocation'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){  //Every time this function fires we get access to the items to the list with help of index.
           return Card(
             child: ListTile(
               onTap: (){
                    updateTime(index);
               },
               title: Text(locations[index].location),
               leading: CircleAvatar(
                 backgroundImage: AssetImage('assets/${locations[index].flag}'),
               ),
             ),
           );
        },
      )


    );
  }
}
