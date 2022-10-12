import 'dart:async';

import 'package:cadastro_usuario_cep_api/Rotas.dart';
import 'package:cadastro_usuario_cep_api/User.dart';
import 'package:cadastro_usuario_cep_api/serviceUsuario.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late UsuarioService _usuarioService;
  StreamController _controller = StreamController<User>.broadcast();

  getUsers(){



 }

  @override
  void initState() {
    _usuarioService = UsuarioService();
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuarios"),
      ),
      body: recuperarDadosStream(),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed((context), Rotas.ROTA_CADASTRO);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,

    ),
    );

  }
  recuperarDadosStream() => FutureBuilder<List<User>>(
      future: _usuarioService.getAllUser(),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
            print("resultado " );
            break;
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
            print("resultado " );
            break;
          case ConnectionState.done:
            if(snapshot.hasError){
              print("resultado "  + snapshot.error.toString());
            }else{

              List<User>? listaUsuario = snapshot.data;
              return listaUser(listaUsuario!);
            }
            break;
        }

        return Center(
          child: Text("DADDOS"),
        );
      });


 Widget listaUser(List<User> listUser) => Container(
   padding: EdgeInsets.all(8),
   child: Expanded(
       child: ListView.builder(
           itemCount: listUser.length,
           itemBuilder: (context,index){
              User user = listUser[index];
             return Card(
               child: ListTile(
                 title: Text(user.nome,),
                 onTap: (){
                    Navigator.pushNamed(context,Rotas.ROTA_CADASTRO,arguments: user);
                 },
                 subtitle: Row(
                    children:<Widget>[
                      Text(user.endereco.cep+","),
                      Text(user.endereco.bairro+","),
                      Text(user.endereco.uf+","),
                      Text(user.endereco.localidade),
                    ],
                 ),
                 trailing: IconButton(
                   icon: Icon(Icons.delete,color:Colors.redAccent,),
                     onPressed: () { deletarUsuario(user); },

                 ),

               )
             );
           })
   )
 );

  deletarUsuario(User user) async{
    _usuarioService.delete(user);
  }
  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
