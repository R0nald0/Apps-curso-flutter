import 'package:flutter/material.dart';

class EmAlta extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>EmAltaState();

}

class EmAltaState extends State<EmAlta>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Em alta'),
        ),
    );
  }
}