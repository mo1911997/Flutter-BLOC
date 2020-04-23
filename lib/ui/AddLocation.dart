import 'package:bloc_demo/bloc/WeatherBLOC.dart';
import 'package:flutter/material.dart';
class AddLocation extends StatefulWidget {
  @override
  
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  var latController = TextEditingController();
  var longController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Column( 
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[ 
               TextField( 
                 onChanged: weatherBloc.getLat,
                 decoration: InputDecoration(
                  hintText: 'Add Latitude'
                ),
                 controller: latController,
               ),
               TextField( 
                 onChanged: weatherBloc.getLong,
                 decoration: InputDecoration( 
                   hintText: 'Add Longitude'
                 ),
                
                 controller: longController,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                 RaisedButton( 
                 onPressed: () {
                   weatherBloc.addLoc();
                 },
                 child: Text('Add'),
               )
               ],)
               
             ],
           ),
    );
  }
}