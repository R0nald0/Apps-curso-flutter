

import 'dart:math';

import 'package:flutter/material.dart';

class Init extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _InitState();
}

class _InitState extends State<Init>{

  var _resultado =[
    "Esolha uma opçao :",
    "Você perdeu!!!!",
    "Você Ganhou !!!!"
  ];

  var escolhoApp = "images/padrao.png";
  var escolhaUser ;


  var imgs=[
        "images/padrao.png",
        "images/pedra.png",
        "images/papel.png",
        "images/tesoura.png"
  ];

   var _mensagem =  "Esolha uma opçao ";

  void teste(){

    if(
           (escolhaUser == imgs[1] && escolhoApp == imgs[3])
        || (escolhaUser==imgs[2] && escolhoApp ==imgs[1])
        ||( escolhaUser==imgs[3] && escolhoApp== imgs[2]) ){
                setState(() {
                    this._mensagem ="Você Ganhou!!!!!!";
                });

    }else if (
                ( escolhoApp ==  imgs[1] && escolhaUser == imgs[3])
             ||(escolhoApp == imgs[2]  && escolhaUser== imgs[1])
             ||(escolhoApp== imgs[3]  && escolhaUser == imgs[2])

            ){
               setState(() {
                   this._mensagem="Você Perdeu!!!!!!";
               });
    }else {
        this._mensagem="Deu Empate !!!!!!!!";
    }

  }


  @override
  Widget build(BuildContext context) {

     return Scaffold(
       appBar:AppBar(
           title:Text("Joken Po"),
       ) ,

       body: Center(

           child: Container(
             padding:EdgeInsets.all(16),
             margin: EdgeInsets.fromLTRB( 0,15,0,10),
             child: Column(
               children: <Widget>[
                 Text("Escolha do App:",
                   style:TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold
                   ) ,
                 ),

                     Image.asset( escolhoApp ),


                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text( _mensagem,
                        style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),

                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                         GestureDetector(
                           onTap: (){
                                setState(() {
                                     escolhoApp = imgs[escolherImagem()];
                                });
                                escolhaUser = imgs[1];
                                teste();
                           },
                            child:Image.asset(imgs[1],height: 100,width: 100)
                         ),

                        GestureDetector(
                            onTap: (){

                              setState(() {
                                escolhoApp = imgs[escolherImagem()];
                              });

                              escolhaUser = imgs[2];
                              teste();
                            },
                            child:Image.asset(imgs[2],height: 100,width: 100)
                        ),

                        GestureDetector(
                            onTap: (){
                              setState(() {
                                escolhoApp = imgs[escolherImagem()];

                              });
                              escolhaUser = imgs[3];
                              teste();
                            },
                            child:Image.asset(imgs[3],height: 100,width: 100)
                        ),

                      ],
                   ),
               ],
             ),
           ),

       ),
     );
  }

    int escolherImagem( ){
     int imgEscholido= Random().nextInt(imgs.length).clamp(1, 3);

     return imgEscholido;
  }
}
