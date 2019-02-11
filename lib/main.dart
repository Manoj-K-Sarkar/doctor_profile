import 'package:doctor_profile/app_screens/doctorprofilepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Doctor Profile",
      debugShowCheckedModeBanner: false,
      home: DoctorProfilePage(),
    );
  }
}