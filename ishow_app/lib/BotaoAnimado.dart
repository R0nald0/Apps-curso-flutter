
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoAnimado extends StatelessWidget{
  final AnimationController controller;
  final Animation<double> largura;
  final Animation<double> fadeIn;

  BotaoAnimado({required this.controller}) :
      largura = Tween<double>(
           end:500,
           begin: 0
      ).animate(CurvedAnimation(parent: controller,
          curve: Interval(
              0.0, 0.3
          )
        )
      ),
        fadeIn = Tween<double>(
        begin: 0,end: 1
      ).animate(CurvedAnimation(parent: controller,
          curve: Interval(
             0.5,1.0
          )
      ))
  ;

  Widget builderAnimation( BuildContext context ,Widget? widget){
    return InkWell(
      onTap: (){},
      child:Container(
        height: 60,
        width: largura.value,
        child: FadeTransition(
          opacity: fadeIn,
          child: Center(
            child: Text("Entrar",style: TextStyle(
                color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
            ),),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 100, 127, 1),
                  Color.fromRGBO(255, 123, 145, 1)
                ]
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: this.controller,
      builder: builderAnimation
    );
  }

}