import 'package:cadastro_usuario_cep_api/Home.dart';
import 'package:cadastro_usuario_cep_api/Rotas.dart';
import 'package:cadastro_usuario_cep_api/view/CadastroUser.dart';
import 'package:flutter/material.dart';

import 'User.dart';

void main(){
  runApp(MaterialApp(
      home:Home(),
      initialRoute: Rotas.ROTA_HOME,
      onGenerateRoute:Rotas.routerConfig,
  ));
}