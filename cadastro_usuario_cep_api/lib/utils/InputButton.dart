import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputButton extends StatelessWidget {

  late double paddingTop;
  late double paddingBottom;
  late double bordeCircle;
  late Widget _titulo;
  late String _hintText;
  TextEditingController _textEditingController ;


  InputButton(@required this._titulo, @required this._hintText,@required this._textEditingController,{
    this.bordeCircle =10,
    this.paddingBottom =5,
    this.paddingTop = 5,
  }
);

  @override
  Widget build(BuildContext context) =>Padding(

    padding: EdgeInsets.only(top: this.paddingTop,bottom:this.paddingBottom),
    child:TextFormField(
      controller: this._textEditingController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(this.bordeCircle)
          ),
          label:this._titulo,
          hintText:this._hintText
      ),
    ),
  );
}
