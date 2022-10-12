import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home>{

  String _valor="0.0";
  String _dolar="0.0";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Padding(padding:EdgeInsets.only(top: 140),
            child: Image.asset("imagens/bitcoin.png"),
            ),
            
            Padding(
              padding:EdgeInsets.only(top:30),
              child: Text("R\$ ${_valor} ",
               style: TextStyle(
                 fontSize: 35
               ),
              )
            ),

            Padding(
                padding:EdgeInsets.only(top:20),
                child: Text("R\$ ${_dolar} ",
                  style: TextStyle(
                      fontSize: 35
                  ),
                )
            ),

            Padding(padding:EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amber)
                ),
                onPressed: _atualizarPreco,
                child: Text("Atualizar Preço",
                style: TextStyle(
                  fontSize: 20
                ),
                ),
              ),
            ),

            
            
          ],
          
        ),
      ),
    );

  }

  void _atualizarPreco() async{
      Uri url = Uri.parse("https://blockchain.info/ticker");
      Uri urlDolar = Uri.parse("https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL");

     http.Response response,response2;
     response = await http.get(url);
     response2 = await http.get(urlDolar);




     Map<String,dynamic> resDolar =jsonDecode(response2.body);

     Map<String,dynamic> res = jsonDecode(response.body) ;
      print(resDolar);

     setState(() {
       _valor = res["BRL"]["buy"].toString();
       _dolar = resDolar["USDBRL"]["high"].toString();
     });


  }

}