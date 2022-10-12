import 'dart:math';

import 'package:cara_ou_coroa/telaSorte.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homeState();

}



class _homeState extends State<home>{

  List nomeImg=[
      "images/moeda_cara.png",
     "images/moeda_coroa.png"
  ];

  String escolha = "";

  @override
  Widget build(BuildContext context) {


    void gerarNumero(){
      int numeroAleatorio = Random().nextInt(nomeImg.length);
      escolha = nomeImg[numeroAleatorio];
    }

    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
         padding:EdgeInsets.all(40) ,  
        child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top:130),
                  child:  Image.asset("images/logo.png",height: 120,),

              ),


              Padding(
                  padding: EdgeInsets.only(top:50),
                child: GestureDetector(
                  onTap: (){
                     gerarNumero();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => telaSorte(escolha))
                    );
                  },
                  child:Image.asset("images/botao_jogar.png"),
                ),

              ),

            ],
          ),
      ),

    );

  }

}