import 'package:flutter/material.dart';

class DoctorProfilePage extends StatelessWidget{
  final String _fullName = "Dr. S K Tripathi";
  final String _achivments = "MBBS,AIMS,PHD";
  final String _specialist = "Dentist";

  Widget _builderCoverImage(Size screenSize){
    return Container(
        height: screenSize.height / 2.5,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/blueCover_stethoscope.jpg'),
              fit: BoxFit.cover,
            )
        )
    );
  }

  Widget _builderProfileImage(){
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/doc1.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName(){
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Raleway',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      _fullName,
      style: _nameTextStyle,
    );
  }

  Widget _buildAchivments(){
    TextStyle _nameTextStyle = TextStyle(
      color: Colors.black26,
      fontSize: 20.0,
    );

    return Text(
      _achivments,
      style: _nameTextStyle,
    );
  }

  Widget _buildSpecialist(){
    TextStyle _nameTextStyle = TextStyle(
      color: Colors.indigo,
      fontSize: 14.0,
    );

    return Text(
      _specialist,
      style: _nameTextStyle,
    );
  }

  Widget _buildOptions(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[

          RaisedButton(
            child: Text("Location"),
            onPressed: (){

              showDialog<String>(
                context: context,
                builder: (BuildContext context)=>SimpleDialog(
                  title:Text("Choose"),
                  children:<Widget>[
                    ListTile(title: Text("Ruby Hospital"),onTap: ()=>Navigator.pop(context,"ABC"),),
                    ListTile(title: Text("Calcutta Super Specialist Hospital"),onTap: ()=>Navigator.pop(context,"ABC1"),),
                    ListTile(title: Text("Apollo Hospital"),onTap: ()=>Navigator.pop(context,"ABC2"),),
                  ],
                ),
              ).then<String>((resvalue){
                if(resvalue!=null){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("You Clicked $resvalue"),
                      action: SnackBarAction(label: "OK", onPressed: (){}),
                    ),
                  );
                }
              });
            },
          ),

          RaisedButton(
            child: Text("Pick Date"),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(3000),
              ).then<DateTime>((DateTime obj) {
                if (obj != null) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("Selected date is $obj"),
                      action: SnackBarAction(label: "OK", onPressed: () {}),
                    ),
                  );
                }
              });
            },
          ),

          RaisedButton(
            child: Text("Time Slot"),
            onPressed: (){

              DateTime obj=DateTime.now();
              showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: obj.hour, minute: obj.minute),
              ).then<TimeOfDay>((TimeOfDay obj){
                if(obj!=null){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("${obj.format(context)}"),
                      action: SnackBarAction(label: "OK", onPressed: (){}),
                    ),
                  );
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context){
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                  onTap: () => print("book"),
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.black12,
                    ),
                    child: RaisedButton(
                      child: Text("BOOK"),
                      onPressed: (){

                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context)=>AlertDialog(
                            title:Text("Booking"),
                            content: Text("Are You Sure??"),
                            actions: <Widget>[
                              MaterialButton(
                                child: Text("Cancel"),
                                onPressed: ()=>Navigator.pop(context,"Cancel"),
                              ),
                              MaterialButton(
                                child: Text("OK"),
                                onPressed: ()=>Navigator.pop(context,"OK"),
                              ),
                            ],
                          ),
                        ).then<String>((resvalue){
                          if(resvalue!=null){
                            Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("You Clicked $resvalue"),
                                action: SnackBarAction(label: "OK", onPressed: (){}),
                              ),
                            );
                          }
                        });

                      },
                    ),
                  )
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: InkWell(
                  onTap: () => print("emergency"),
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.redAccent,
                    ),

                      child: RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.redAccent,
                        child: Text(
                          "EMERGENCY",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context)=>AlertDialog(
                              title:Text("Emergency Call"),
                              actions: <Widget>[
                                MaterialButton(
                                  child: Text("Cancel"),
                                  onPressed: ()=>Navigator.pop(context,"Cancel"),
                                ),
                                MaterialButton(
                                  child: Text("Dial"),
                                  onPressed: ()=>Navigator.pop(context,"OK"),
                                ),
                              ],
                            ),
                          ).then<String>((resvalue){
                            if(resvalue!=null){
                              Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text("You Clicked $resvalue"),
                                  action: SnackBarAction(label: "OK", onPressed: (){}),
                                ),
                              );
                            }
                          });
                        },
                      ),

                  )
              ),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
            children:<Widget>[
              _builderCoverImage(screenSize),
              SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: screenSize.height / 5),
                        _builderProfileImage(),
                        _buildFullName(),
                        _buildAchivments(),
                        _buildSpecialist(),
                        _buildOptions(context),
                        _buildButtons(context),
                      ],
                    ),
                  )
              )
            ]
        )
    );
  }

}