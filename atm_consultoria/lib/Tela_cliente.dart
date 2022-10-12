import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tela_cliente extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Tela_clienteState();
}

class _Tela_clienteState extends State<Tela_cliente>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Cliente"),
        backgroundColor: Colors.amberAccent,
      ),

      body: Container(
         child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                   Padding(
                       padding:EdgeInsets.only(top: 17,left: 17),
                       child: Row(
                           children: [
                             Image.asset("images/detalhe_cliente.png"),
                             Padding(padding: EdgeInsets.only(left: 10)),
                             Text("Clientes",
                             style: TextStyle(
                                 fontSize: 20
                              ),
                             ),
                           ],
                       ),
                   ),

                 Padding(
                     padding:EdgeInsets.only(top: 10),
                      child: Column(
                          children:<Widget> [
                            Image.asset("images/cliente1.png"),
                            Text("Empresa de Softwaare"),
                            Image.asset("images/cliente2.png"),
                            Text("Empresa de Auditoria"),


                          ],
                      ) ,
                 )

               ],
             ),



         ),
      ),

    );
  }

}