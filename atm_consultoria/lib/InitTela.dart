import 'package:atm_consultoria/Tela_cliente.dart';
import 'package:atm_consultoria/Tela_contato.dart';
import 'package:atm_consultoria/Tela_servico.dart';
import 'package:atm_consultoria/telaEmpresa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitTela extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _InitTelaState();

}

class _InitTelaState extends State<InitTela>{

  double imgHeight = 100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
           title: Text("ATM Consultoria"),
          backgroundColor: Colors.blue,
        ),

            body:Container(
                child: SingleChildScrollView(
                   padding: EdgeInsets.all(42),

                  child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                        Padding(
                          padding:EdgeInsets.only(top:50,),
                         child: Column(
                           children:<Widget> [
                             Image.asset("images/logo.png"),


                             Padding(
                                 padding:EdgeInsets.only(top: 20),
                               child: Row(

                                 children: [

                                   Padding(
                                     padding: EdgeInsets.only(right: 60,),
                                     child: GestureDetector(
                                       onTap: (){
                                           Navigator.push(context,
                                               MaterialPageRoute(
                                                   builder: (context)=>telaEmpresa(),
                                               ),
                                           );

                                       },
                                       child:Image.asset("images/empresa.png",height: imgHeight),
                                     ),
                                   ),



                                  GestureDetector(
                                     onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Tela_servico(),
                                              ),
                                          );
                                     },
                                     child:Image.asset("images/servicos.png",height: imgHeight,
                                     ),
                                   )
                                 ],
                               ),
                             ),



                             Padding(
                               padding:EdgeInsets.only(top: 20),
                               child: Row(

                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(right: 60,),
                                     child:

                                     GestureDetector(
                                       onTap: (){
                                         Navigator.push(
                                             context,
                                             MaterialPageRoute(builder: (context)=> Tela_cliente(),
                                             )

                                         );
                                       },
                                       child:Image.asset("images/cliente.png",height: imgHeight),
                                     ),
                                   ),



                                   GestureDetector(
                                     onTap: (){
                                       Navigator.push(
                                           context,
                                           MaterialPageRoute(builder: (context)=> Tela_contato(),
                                           )
                                       );


                                       },
                                     child:Image.asset("images/contato.png",height:imgHeight,
                                     ),
                                   )

                                 ],
                               ),
                             )




                           ],
                         ),
                        )

                    ],
                  ),

                )
            ) ,

    );
  }

}