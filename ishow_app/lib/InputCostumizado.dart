import 'package:flutter/material.dart';

class InputCostomizado extends StatelessWidget{
  late final String hint ;
  late final bool obscureText;
   final Icon icon  ;

   InputCostomizado({
     required this.hint,
     this.obscureText = false,
     this.icon =const Icon(Icons.person,color: Colors.grey,)
   });


  @override
  Widget build(BuildContext context) {
   return  Container(
     padding: EdgeInsets.all(8),
     child: TextField(
       obscureText: this.obscureText,
       keyboardType: TextInputType.emailAddress ,
       decoration: InputDecoration(
           border: InputBorder.none,
           icon: this.icon,
           hintText: this.hint,
           helperStyle: TextStyle(
             fontSize: 18,
             color: Colors.grey[600],
           )
       ),
     ),
   );
  }

}