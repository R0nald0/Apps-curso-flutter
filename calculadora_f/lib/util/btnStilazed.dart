import 'dart:ffi';

import 'package:flutter/material.dart';

class BtnStilized extends StatelessWidget {

   late Color corBtn =Colors.green;
   late Function()? onTap;
   late TextStyle  style ;
   late String textoBtn;
   late double tamanhoWidth;
   late double tamanhoHeight;
   late double paddingLeft ;
   late double paddingRight ;

   BtnStilized({
     required this.onTap,
     required this.style ,
     required this.textoBtn,
      this.corBtn = Colors.blue,
     this.tamanhoWidth =113,
     this.tamanhoHeight =45,
     this.paddingLeft=0,
     this.paddingRight=0
}){}

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: this.paddingLeft,right:this.paddingRight ),
      width: this.tamanhoWidth,
      height: this.tamanhoHeight,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: this.corBtn,
            textStyle: this.style,
          ),
          onPressed:this.onTap,
          child: Text(this.textoBtn)
      )
    );
  }
}
