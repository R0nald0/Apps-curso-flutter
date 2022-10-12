import 'dart:ffi';

import 'package:flutter/material.dart';

class customSearchDelegate extends SearchDelegate<String>{

  @override
  List<Widget>? buildActions(BuildContext context) {

       return[
          IconButton(
              onPressed: (){
                query="";
              },
              icon: Icon(
                Icons.close
              )
          ),
       ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(
        onPressed: (){
            close(context,"");
        },
        icon: Icon(
            Icons.arrow_back
        )
    );

  }

  @override
  Widget buildResults(BuildContext context) {

    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   // print(query );
    return Container();
  }

}