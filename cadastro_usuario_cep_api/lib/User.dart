

import 'package:cadastro_usuario_cep_api/Endereco.dart';
import 'package:flutter/cupertino.dart';

class User{
   late  String _nome;
   late  int _id;
     Endereco _endereco = Endereco();

   User(){}

   String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

   int get id => _id;

  set id(int value) {
    _id = value;
  }

   Endereco get endereco => _endereco;

  set endereco(Endereco value) {
    _endereco = value;
  }

}