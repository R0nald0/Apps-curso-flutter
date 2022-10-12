import 'package:flutter/material.dart';
import 'package:youtubapp/ApiYoutube.dart';
import 'package:youtubapp/ApiYoutube.dart';
import 'package:youtubapp/model/Video.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Inicio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InicioState();

  late String resultado ;
  Inicio(this.resultado);

}

class InicioState extends State<Inicio>{


    _listarVideo( String pesquisa){
      Api api = Api();
     return  api.Pesquisar(pesquisa);
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
        future:_listarVideo(widget.resultado) ,
        builder:(context,snapshot){
          String retorno ="";

          switch(snapshot.connectionState){

            case  ConnectionState.none:
            case  ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
                break;
            case  ConnectionState.active:

            case  ConnectionState.done:

              if(snapshot.hasData){
                   print(widget.resultado);
                   return ListView.separated(
                       itemBuilder: (context,index){
                           List<Video>? video = snapshot.data;
                           Video vid = video![index];

                          return GestureDetector(
                             onTap: (){
                              //  YoutubePlayerController controller = YoutubePlayerController(initialVideoId: vid.id);
                             },

                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit:BoxFit.cover,
                                      image: NetworkImage(vid.imagem),
                                    ),
                                  ),


                                ) ,
                                ListTile(
                                  title:Text(vid.titulo),
                                  subtitle: Text(vid.canal ),
                                )
                              ],
                            ),
                          );
                       },
                       separatorBuilder: (contex,index)=> Divider(
                          height: 3,
                         color: Colors.red,
                       ),
                       itemCount: snapshot.data!.length
                   );

               }else{
                 return Center(
                   child: Text("Erro"),
                 );
               }
            break;
          }

            return Center(
                child: Text(retorno),
            ) ;

        }
    );
  }
}