import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{

  Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/Europe/London"));
  Map data = jsonDecode(response.body);
  String date = data['datetime'];
  String offset = data['utc_offset'].substring(1,3);

  DateTime dateTime = DateTime.parse(date);
  dateTime = dateTime.add(Duration(hours: int.parse(offset)));
  print(dateTime);


  }

  @override
  void initState() {
    super.initState();
    getTime();
  }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text("Loading screen"),),
    );
  }
}
