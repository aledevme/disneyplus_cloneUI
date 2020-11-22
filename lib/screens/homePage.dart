import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff373a41)
          /*gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blueGrey[900],
              Colors.blue[100]
            ]
          )*/
        ),
      ),
    );
  }

  Widget appBar(){
    return AppBar(
      backgroundColor: Color(0xff373a41),
      elevation: 0,
      title: Image(
        height: 100,
        width: 100,
        image: AssetImage('assets/poster/disneypluslogowhite.png'),
      ),
    );
  }

  Widget sliderTopContent(){

  }
  Widget brands(){
    return ListView.builder(

    );
  }
}