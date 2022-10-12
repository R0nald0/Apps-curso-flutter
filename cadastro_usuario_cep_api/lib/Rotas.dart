

import 'package:cadastro_usuario_cep_api/Home.dart';
import 'package:cadastro_usuario_cep_api/view/CadastroUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rotas{
    static const ROTA_CADASTRO = "/cadastro";
    static const ROTA_HOME = "/home";
   static  var arg;

    static Route<dynamic>? routerConfig(RouteSettings settings){
         arg = settings.arguments;

       switch(settings.name){
         case ROTA_CADASTRO:
           return MaterialPageRoute(builder: (_)=>CadastrarUser(arg)


             );
           break;

         case ROTA_HOME:
           return MaterialPageRoute(builder: (_)=>Home());
        }
    }
 }