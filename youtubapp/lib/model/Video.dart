import 'package:flutter/material.dart';

class Video{

  late String id;
  late String titulo;
  late String imagem;
  late String canal;
  late String descricao;

  Video({ required this.id,  required this.titulo, required this.imagem,  required this.canal,  required this.descricao});



    /*
    static converterJson(Map<String,dynamic> json) {
      return Video(
          id: json["id"]["videoId"],
          titulo: json["snippet"]["title"],
          imagem: json["snippet"]["thumbnails"]["high"]["url"],
          canal: json["snippet"]["channelId"],
          descricao: json["snippet"]["description"],
       );
    }
    }
  */


    factory Video.fromJson( Map <String, dynamic > json)
    {
      return Video(
        id: json["id"]["videoId"],
        titulo: json["snippet"]["title"],
        imagem: json["snippet"]["thumbnails"]["high"]["url"],
        canal: json["snippet"]["channelTitle"],
        descricao: json["snippet"]["description"],
      );

  }
}