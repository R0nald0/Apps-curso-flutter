import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtubapp/custonSearchDelegate.dart';
import 'package:youtubapp/telas/Arquivos.dart';
import 'package:youtubapp/telas/EmAlta.dart';
import 'package:youtubapp/telas/Inicio.dart';
import 'package:youtubapp/telas/Inscricoes.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeState();
  
}

class HomeState extends State<Home>{

   int indiceAtual = 0;
   String _resultaod ="";



  @override
  Widget build(BuildContext context) {

    List<Widget> listTelas = [

      Inicio(_resultaod),
      EmAlta(),
      Inscricoes(),
      Arquivos()


    ];

    return Scaffold( 

         appBar: AppBar(
           iconTheme: IconThemeData(color: Colors.grey) ,
           title: Image.asset('images/youtube.png',
             height:100 ,
           width: 100,),
           backgroundColor: Colors.white,
           actions: <Widget>[
              IconButton(
                  onPressed: (){
                    print("Videos");
                  },
                  icon: Icon(
                     Icons.videocam,

                  ),
              ),

             IconButton(
                 onPressed: () async{
                     String? res =await showSearch(context: context, delegate: customSearchDelegate(),
                    );
                      setState(() {
                        _resultaod = res!;
                      });
                 },
                 icon: Icon(
                   Icons.search,

                 )
             ),

             IconButton(
                 onPressed: (){
                   print("Conta");
                 },
                 icon: Icon(
                   Icons.account_circle,
                 )
             ),

           ],
         ),

      body: Container(
          padding: EdgeInsets.all(16),
           child: Center(
             child: listTelas[indiceAtual],
           ),
      ),



      bottomNavigationBar: BottomNavigationBar(
         selectedLabelStyle: TextStyle(
             fontStyle: FontStyle.italic,
             fontWeight: FontWeight.bold,
         ),

          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          currentIndex: indiceAtual,
          onTap: (indice){
            setState(() {
                indiceAtual = indice;
            });
        },


        items: [
          BottomNavigationBarItem(

            title: Text("Inicio"),
            icon: Icon(
              Icons.home,
            )
          ),
          BottomNavigationBarItem(
            title: Text("Em Alta"),
              icon: Icon(
                Icons.whatshot,
              ),
          ),

          BottomNavigationBarItem(
              title: Text("Incrições"),
              icon:Icon(
                 Icons.subscriptions,
              ) ),

          BottomNavigationBarItem(
              title: Text("Arquivos"),
              icon: Icon(
                Icons.folder,
              ))
        ],
      )

    );
  }
  
  
}