import 'package:flutter/material.dart';

class Inscricoes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InscricoesState();

}

class InscricoesState extends State<Inscricoes>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
       body:Center(
         child: Text("Inscriçoes "),
       ),
    );
  }
}