import 'package:flutter/material.dart';

class telaSorte extends StatefulWidget{
   String moeda ;

   telaSorte(this.moeda);


  @override
  State<StatefulWidget> createState() => _telaSorteState();

}

class _telaSorteState extends State<telaSorte>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Color(0xff61bd86),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 120)),
            Image.asset("${widget.moeda}",height: 250),

            Padding(
                padding: EdgeInsets.only(top: 20),
               child:  GestureDetector(
                 onTap: (){
                    Navigator.pop(context);
                 },
                 child:Image.asset("images/botao_voltar.png"),

              ),
            )
          ],
        ),
      ),

    );

  }
  }



