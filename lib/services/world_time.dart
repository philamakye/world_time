import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time='';
  String flag;
  String url;
  bool isDayTime=true;

  WorldTime({required this.location, required this.flag, required this.url,});

  Future<void> getTime() async{
   try{
     Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
     Map data = jsonDecode(response.body);
     String date = data['datetime'];
     String offset = data['utc_offset'].substring(1,3);

     DateTime dateTime = DateTime.parse(date);
     dateTime = dateTime.add(Duration(hours: int.parse(offset)));

     isDayTime = dateTime.hour > 6 && dateTime.hour <20 ? true : false;
     time = DateFormat.jm().format(dateTime);
   }catch(e){
     print("Caught error: $e");
     time="Could not get time";
   }
  }


}