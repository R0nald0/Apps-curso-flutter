import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Init extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _InitState();

}

class _InitState extends State<Init>{

  var nameLogo="images/logo.png";
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina= TextEditingController();

  var resultado ="";

  void calcularPreco(){

    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasoline = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasoline == null ){
      resultado = "Digite valores válidos com (.)";
    }else{

      if(precoAlcool / precoGasoline >= 0.7){
         setState(() {
           resultado = "Melhor Abastecer com Gasolina";
         });

      }else{
          setState(() {
            resultado ="Melhor bastecer com Álcool";
          });

      }
      LimparCmpos();
    }

  }

  void LimparCmpos(){
     _controllerGasolina.text = "" ;
     _controllerAlcool.text= " " ;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(nameLogo,height: 90,width: 90,),
        backgroundColor: Colors.cyan,
      ),

      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("images/youtube.png"),

                Padding(padding: EdgeInsets.only(top: 15),
                  child:  Text("Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),


                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                TextField(
                      keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                      labelText: "Preço Alcool , ex 1,43",
                    ),
                  controller: _controllerAlcool,
                ),

                TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                        labelText:"Preço Gasolina , ex 4,43" ,

                    ),
                    controller: _controllerGasolina,

                ),

                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child:  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: calcularPreco,
                      child:Text("Calcular",
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic
                        ),
                      )
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 10),
                  child:Text(resultado,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
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

