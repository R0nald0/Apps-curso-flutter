import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class telaEmpresa extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _telaEmpresaState();

}

class _telaEmpresaState extends State<telaEmpresa>{

  String textoEm="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet neque non arcu vestibulum hendrerit. "
      "Suspendisse porttitor libero ut congue eleifend. Nunc id eros volutpat, "
      "volutpat ante sed, lacinia metus. Integer vel pellentesque sem. "
      "Nam dignissim mauris ut varius eleifend. Pellentesque finibus dui vitae hendrerit fringilla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet neque non arcu vestibulum hendrerit. "
      "Suspendisse porttitor libero ut congue eleifend. Nunc id eros volutpat, "
      "volutpat ante sed, lacinia metus. Integer vel pellentesque sem. "
      "Nam dignissim mauris ut varius eleifend. Pellentesque finibus dui vitae hendrerit fringilla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet neque non arcu vestibulum hendrerit. "
      "Suspendisse porttitor libero ut congue eleifend. Nunc id eros volutpat, "
      "volutpat ante sed, lacinia metus. Integer vel pellentesque sem. "
      "Nam dignissim mauris ut varius eleifend. Pellentesque finibus dui vitae hendrerit fringilla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet neque non arcu vestibulum hendrerit. "
      "Suspendisse porttitor libero ut congue eleifend. Nunc id eros volutpat, "
      "volutpat ante sed, lacinia metus. Integer vel pellentesque sem. "
      "Nam dignissim mauris ut varius eleifend. Pellentesque finibus dui vitae hendrerit fringilla,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet neque non arcu vestibulum hendrerit. "
      "Suspendisse porttitor libero ut congue eleifend. Nunc id eros volutpat, "
      "volutpat ante sed, lacinia metus. Integer vel pellentesque sem. "
      "Nam dignissim mauris ut varius eleifend. Pellentesque finibus dui vitae hendrerit fringilla";

  double imgHeight = 100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("A Empresa"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
               Padding(
                   padding: EdgeInsets.only(top: 10,left: 10),
                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Row(
                        children: [
                          Image.asset("images/detalhe_empresa.png"),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text("Sobre a Empresa",
                          style:TextStyle(
                              color: Colors.green,
                               fontSize: 20
                          ),)
                        ],
                     ),
                     Padding(padding: EdgeInsets.only(top:10)),
                     Text(textoEm,
                     style:TextStyle(
                        fontStyle: FontStyle.italic,
                       fontWeight: FontWeight.bold
                     ),
                     ),
                   ],
                 ),
               
               )

            ],

        ),

        )
      ),

    );
  }

}