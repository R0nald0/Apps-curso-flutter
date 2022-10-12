
import 'dart:convert';

import 'package:cadastro_usuario_cep_api/User.dart';
import 'package:http/http.dart' as http;

 class UsuarioService{
  String url ="http://10.0.2.2:8080/user";

    Future<List<User>> getAllUser()async{
    http.Response response =  await http.get(Uri.parse(url));
    var dados = jsonDecode(response.body);

    List<User> _listUser= [];

    for(var item in dados){
       User usuario = User();
       usuario.nome =item['nome'];
       usuario.id =item['id'];
       usuario.endereco.cep =item['endereco']["cep"];
       usuario.endereco.bairro =item['endereco']["bairro"];
       usuario.endereco.complemento =item['endereco']["complemento"];
       usuario.endereco.ddd =item['endereco']["ddd"];
       usuario.endereco.localidade =item['endereco']["localidade"];
       usuario.endereco.logradouro =item['endereco']["logradouro"];
       usuario.endereco.uf =item['endereco']["uf"];

       _listUser.add(usuario);

    }

    return _listUser;
  }

  Future novoUsuario(User user) async{
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-type" :"application/json; charset=UTF-8"},
      body: jsonEncode(<String,dynamic>{
        "nome": user.nome,
        "id" :0,
        "endereco" :{
            "cep" : user.endereco.cep
        }
      })
    );
    if(response.statusCode ==200) {
      print("resultado " + response.body.toString());
      return response.body;
    }else{
      print("resultado  erro");
    }
    print("resultado " + response.statusCode.toString());
  }

   Future<int> editarUsuario(User user) async{
     http.Response response = await http.put(Uri.parse(url+"/${user.id}"),
       headers: {'Content-Type': 'application/json; charset=UTF-8'},
       body: jsonEncode(<String,dynamic>{
         "nome": user.nome,
         "id" :user.id,
         "endereco" :{
           "cep" : user.endereco.cep
         }
       })
     );

     if(response.statusCode ==200) {
       print("resultado " + response.body.toString());
     }else{
       print("resultado  erro");
     }
     print("resultado " + response.statusCode.toString());

     return response.statusCode;
  }

  Future delete(User user) async{
      http.Response response =  await http.delete(Uri.parse(url+"/${user.id}"));

      if(response.statusCode ==200) {
        print("resultado " + response.body.toString());
        this.getAllUser();
        return response.body;
      }else{
        print("resultado  erro");
      }
      print("resultado " + response.statusCode.toString());
  }
}
