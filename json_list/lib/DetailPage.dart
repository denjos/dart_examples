import 'package:flutter/material.dart';
import 'package:json_list/Back.dart';

import 'User.dart';

class DetailPage extends StatelessWidget{
  final User user;
  DetailPage(this.user);
  @override
  Widget build(BuildContext context) {


    final button=new InkWell(
      child:  new Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0
        ),
        height: 50.0,
        width: 180.0,
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Color(0xFFf38b02),
             offset: new Offset(10.0, 10.0),
              blurRadius: 30.0
            )
          ],
          borderRadius: new BorderRadius.circular(30.0),
          color: Color(0xFFfeb800),
        ),
        child: new Center(
          child: Text(
            "GUARDAR",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
              fontWeight: FontWeight.w900
            ),
          ),

        ),
      ),
    );


    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Back(),
          new Container(
            alignment: Alignment.center,
            margin:new EdgeInsets.only(
              top:50.0
            ),
            child: new Column(
              children: <Widget>[
                new Text(
                  user.name,
                  style:const TextStyle(
                    fontSize: 55.0,
                    color: Color(0xFFeba800),
                    fontWeight: FontWeight.w600
                  ),
                ),
                button
              ],
            ),
          )
        ],
      ),

    );
  }

}