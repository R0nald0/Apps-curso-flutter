import 'dart:async';

import 'package:cadastro_usuario_cep_api/Rotas.dart';
import 'package:cadastro_usuario_cep_api/User.dart';
import 'package:cadastro_usuario_cep_api/serviceUsuario.dart';
import 'package:cadastro_usuario_cep_api/utils/InputButton.dart';
import 'package:flutter/material.dart';


class CadastrarUser extends StatefulWidget {

   User _user ;

 CadastrarUser( this._user);


  @override
  State<CadastrarUser> createState() => _CadastrarUserState();
}

class _CadastrarUserState extends State<CadastrarUser> {

  late UsuarioService _usuarioService ;
  late User _usuario;

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerCep = TextEditingController();



  @override
  void initState() {
    _usuarioService = UsuarioService();
      _usuario = widget._user;
       super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
              title: Text("Cadastrar Usuario",),
           ),
           body:Container(
             padding: EdgeInsets.all(32),
             child: Center(
               child: Column(
                 children: <Widget>[
                   Text("Cadastrar Usuário",style: TextStyle(fontSize: 23)),
                   Container(
                     child:Column(
                       children: <Widget>[
                          InputButton( _usuario!=null? Text("${_usuario.nome}") :Text("nome"),
                              "Inisira o nome",_controllerNome,paddingTop: 10),


                          InputButton(_usuario!=null?Text("${_usuario.endereco.cep}") :Text("nome"),
                              "Inisra um Cep",_controllerCep,paddingTop: 10),
                          ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             primary: Colors.purple,
                             fixedSize: Size(140,20),
                           ),
                             onPressed: (){
                                if(_usuario !=null){
                                     editarUsuario(_controllerNome.text.toString(), _controllerCep.text.toString());
                                }else{
                                  salvarUsuario(_controllerNome.text.toString(), _controllerCep.text.toString());
                                }
                             },
                             child: Text("Salvar",style: TextStyle(),)
                         )
                       ],
                     )
                   )
                 ],
               ),
             )
           ),
    );
  }

  salvarUsuario(String nome ,String cep) async{
    User user = User();

     user.nome = nome;
     user.endereco.cep =cep;
     print("resultado " + user.endereco.cep);
    await _usuarioService.novoUsuario(user);

  }

  editarUsuario(String nome ,String cep)async{
    if(nome.isNotEmpty || cep.isNotEmpty){
        User user = User();
          user.id = _usuario.id;
          user.nome = nome;
          user.endereco.cep =cep;
        if(200 == await _usuarioService.editarUsuario(user)){
        Navigator.pushNamedAndRemoveUntil(context, Rotas.ROTA_HOME, (route) => false);
      }
    }

  }

}
