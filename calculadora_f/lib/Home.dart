import 'dart:ffi';

import 'package:calculadora_f/util/btnStilazed.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String valorTocado = "";
  String sinalTocado = "";
  String valorTocado2= "";
  bool isChange = false;
  double resultado =0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"), key: UniqueKey(),
      ),
      body: Container(
        child:Column(
          children:<Widget>[
            Container(
              padding: EdgeInsets.all(32),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32),bottomRight: Radius.circular(32)),
                color: Colors.grey,
              ),
              alignment: Alignment.topRight,
              child:Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(32),
                   child:Text(resultado == 0?"":resultado.toString()
                     ,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                  ),
                  Text(valorTocado == ""? "0" :valorTocado +" "+ sinalTocado +" " + valorTocado2,
                      style: const TextStyle(fontSize: 25))
                ],
              ),
            ),
            Container(

              margin: EdgeInsets.only(top: 60),
              constraints: BoxConstraints.expand(width: 385,height: 400),
              decoration: BoxDecoration(color: Colors.black26,
              ),
              child:Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                   Row(children: <Widget>[
                     BtnStilized(
                         onTap: (){
                           limparCampos();
                           resultado =0;
                           valorTocado ="";
                         },
                         style: TextStyle(fontSize: 20),
                         textoBtn:"Ac",
                         corBtn: Colors.blue,
                       tamanhoWidth: 72,
                       paddingLeft: 10,
                     ),
                     BtnStilized(
                         onTap:(){selecionarSinal("+");},
                         style: TextStyle(fontSize: 20),
                         textoBtn:"+",
                         corBtn: Colors.blue,
                       tamanhoWidth: 85,
                       paddingLeft: 10,paddingRight: 10,
                     ),
                     BtnStilized(
                         onTap: (){selecionarSinal("-");},
                         style: TextStyle(fontSize: 20),
                         textoBtn:"-",
                         corBtn: Colors.blue,
                       tamanhoWidth: 66,
                     ),
                     BtnStilized(
                         onTap: (){selecionarSinal("*");},
                         style: TextStyle(fontSize: 20),
                         textoBtn:"*",
                         corBtn: Colors.blue,
                       tamanhoWidth: 85,
                       paddingLeft: 10,paddingRight: 10,
                     ),
                     BtnStilized(
                         onTap: (){selecionarSinal("/");},
                         style: TextStyle(fontSize: 20),
                         textoBtn:"/",
                         corBtn: Colors.blue,
                       tamanhoWidth: 66,
                     )
                     ],
                   ),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                     BtnStilized(
                         onTap: (){selecionar("7");},
                         style: const TextStyle(fontSize: 20),
                         textoBtn: "7",
                          tamanhoWidth: 117,
                     ),
                     BtnStilized(
                       onTap:  (){selecionar("8");},
                       style: const TextStyle(fontSize: 20),
                       textoBtn: "8",
                     ),
                     BtnStilized(
                       onTap:  (){selecionar("9");},
                       style: const TextStyle(fontSize: 20),
                       textoBtn: "9",
                     )
                   ],),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      BtnStilized(
                        onTap:  (){selecionar("4");},
                        style: TextStyle(fontSize: 20),
                        textoBtn: "4",
                        tamanhoWidth: 117,
                      ),
                      BtnStilized(
                        onTap:  (){selecionar("5");},
                        style: TextStyle(fontSize: 20),
                        textoBtn: "5",
                      ),
                      BtnStilized(
                        onTap:  (){selecionar("6");},
                        style: TextStyle(fontSize: 20),
                        textoBtn: "6",
                      )
                    ],),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      BtnStilized(
                        onTap:  (){selecionar("1");},
                        style: const TextStyle(fontSize: 20),
                        textoBtn: "1",
                        tamanhoWidth: 117,
                      ),
                      BtnStilized(
                        onTap:  (){selecionar("2");},
                        style: const TextStyle(fontSize: 20),
                        textoBtn: "2",
                      ),
                      BtnStilized(
                        onTap:  (){selecionar("3");},
                        style: const TextStyle(fontSize: 20),
                        textoBtn: "3",
                      )
                    ],),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      BtnStilized(
                        onTap: (){selecionar("0");},
                        style: TextStyle(fontSize: 20),
                        textoBtn: "0",
                        tamanhoWidth: 170,
                      ),
                      BtnStilized(
                        onTap:  (){selecionar(".");},
                        style: TextStyle(fontSize: 20),
                        textoBtn: ".",
                        tamanhoWidth: 70,
                      ),
                      BtnStilized(
                        onTap: (){
                          checkIgual();
                        },
                        style: TextStyle(fontSize: 20),
                        textoBtn: "=",
                        tamanhoWidth: 100,
                      ),

                    ],),

                ],
              ),
            )
          ],
        ),
      )
    );
  }


  checkIgual(){
    double n1= double.parse(valorTocado);
    double n2= double.parse(valorTocado2);

    switch(sinalTocado){
      case "+":
         resultado  = n1+n2;
         print("resultado" + resultado.toInt().toString());
         break;
      case "-":
         resultado = n1-n2;

        break;
      case "*":
        resultado = n1*n2 ;
        break;
      case "/":
        resultado = n1/n2 ;
        break;
    }

    valorTocado = resultado.toString();
    isChange = !isChange;
   limparCampos();
  }
  selecionar(String valor){
      setState(() {
              isChange?valorTocado2 += valor :valorTocado += valor;
      });

  }
  selecionarSinal(String sinal){
      setState(() {
          sinalTocado = sinal;
      });
      isChange =!isChange;
  }

  limparCampos(){
    setState(() {
      valorTocado2 ="";
      isChange = !isChange;
     // sinalTocado ="";
    });
  }
}
