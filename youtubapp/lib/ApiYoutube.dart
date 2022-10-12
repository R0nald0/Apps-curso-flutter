import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtubapp/model/Video.dart';


const CHAVE_DE_API = "AIzaSyCka77OClLHWQ23CCPecC1NUArqoai7Ecg";
const URL_BASE= "https://www.googleapis.com/youtube/v3/";
const ID_CANAL="UCJ8GQ_SNb-33m_BluT4TTlw";

class Api{
  late String  _videoss;

  Future<List<Video>>Pesquisar( String palavra) async{

     http.Response response = await http.get(Uri.parse(
         URL_BASE+"search"
         "?part=snippet"
         "&type=video"
         "&channelId=$ID_CANAL"
         "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_DE_API"
          "&q=$palavra"
     ));

     if( response.statusCode == 200){
       Map<String,dynamic> dados = jsonDecode(response.body) ;

       List<Video> videos = dados["items"].map<Video>(
           (map){
               return Video.fromJson(map);
           }
       ).toList(); // CONVERTANDO MAP EM VIDEOS

       return videos;

     }else{

         print("Erro");
     }
    throw( ){
       return print("");
    };
  }


}