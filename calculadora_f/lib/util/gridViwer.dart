import 'dart:ffi';

import 'package:calculadora_f/util/btnStilazed.dart';
import 'package:flutter/material.dart';

class gridViwer extends StatelessWidget {


  late double crossAxisSpacing ;
  late int crossAxisCount ;
  late double mainAxisSpacing ;
  late Color cor ;
  late List<Widget> widgets;

  gridViwer({
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    this.cor = Colors.red,
    required this.widgets
  }){}

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(16),
      child: GridView.count(
          crossAxisCount: this.crossAxisCount,crossAxisSpacing: this.crossAxisSpacing, mainAxisSpacing:this.mainAxisSpacing,
          children:this.widgets
      )
    );
  }
}

