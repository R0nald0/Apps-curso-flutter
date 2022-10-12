import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tela_contato extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Tela_contatoState();

}

class _Tela_contatoState extends State<Tela_contato>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Contato"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
                Row(
                   children: <Widget>[
                     Image.asset("images/detalhe_contato.png"),
                     Padding(
                         padding:EdgeInsets.only(left: 10),
                         child: Text("Contatos",
                          style: TextStyle(
                             fontSize: 20
                          ),
                         ),
                      )
                   ],
                ),

              Padding(
                padding:EdgeInsets.only(left: 10),
                child: Text("Email:atmConsultoria@atm.com",
                  style: TextStyle(
                      fontSize: 17
                  ),
                ),
              ),

               Padding(
                 padding:EdgeInsets.only(left: 9,top: 10),
                 child: Text("Telefone: (11) 12323123",
                   style: TextStyle(
                       fontSize: 14
                   ),
                 ),
               ),

               Padding(
                 padding:EdgeInsets.only(left: 10),
                 child: Text("Celular:  (11) 911123233",
                   style: TextStyle(
                       fontSize: 14
                   ),
                 ),
               ),

             ],
          ),



        ),
      ),
    );
  }

}