import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tela_servico extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _tela_ServicoState();

}

class _tela_ServicoState extends State<Tela_servico>{


  double imgHeight = 100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Serviços"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
         child: SingleChildScrollView(
           padding: EdgeInsets.all(32),
           child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                  Row(
                    children:<Widget>[
                      Image.asset("images/detalhe_servico.png"),
                      Padding(padding: EdgeInsets.only(left: 16)),
                      Text("Nossos Serviços",
                       style: TextStyle(
                           fontSize: 20,color: Colors.black
                       ),
                      )
                    ],
                  ),

                 Padding(
                   padding: EdgeInsets.only(top: 16),
                  child: Text("Consultoria",
                    style:TextStyle(
                       fontSize: 16,fontStyle: FontStyle.italic
                    ) ,
                  ),
                 ),

                 Padding(
                   padding: EdgeInsets.only(top: 16),
                   child: Text("Preços",
                     style:TextStyle(
                         fontSize: 14,fontStyle: FontStyle.italic
                     ) ,
                   ),
                 ),

                 Padding(
                   padding: EdgeInsets.only(top: 7),
                   child: Text("Acompanhamento de Projetos",
                     style:TextStyle(
                         fontSize: 16,fontStyle: FontStyle.italic
                     ) ,
                   ),
                 ),

               ],
           ),
         ),

      ),

    );
  }

}