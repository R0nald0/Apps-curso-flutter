import 'package:flutter/material.dart';

class Arquivos extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  => ArquivosState();

}

class ArquivosState  extends State<Arquivos>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child:  Text("Arquivos"),
        ),
    );
  }
}