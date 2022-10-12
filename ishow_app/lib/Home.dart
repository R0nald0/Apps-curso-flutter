import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ishow_app/BotaoAnimado.dart';

import 'InputCostumizado.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late AnimationController _controller ;
  late Animation<double> _animationBlur;
  late Animation<double> _animationFade;
  late Animation<double> _animationSize;
  late Animation<Offset> _animationSlideT;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 5)
    );

    _animationBlur = Tween<double>(
       end: 0,
      begin: 5
    ).animate(CurvedAnimation(parent: _controller, curve:Curves.ease));

    _animationFade = Tween<double>(
      begin: 0,
      end: 10
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.slowMiddle));

    _animationSize = Tween<double>(
      end: 500,
      begin:20
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));

    _animationSlideT = Tween<Offset>(
      begin: Offset(-1,0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve:Curves.linearToEaseOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(

     body: Container(
       child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AnimatedBuilder(
                    animation: _animationBlur,
                    builder: (context ,widget){
                      return  Container(
                        height: 500,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:AssetImage("imagens/fundo.png"),
                                fit: BoxFit.cover
                            )
                        ),
                        child:BackdropFilter( //EFEITO BLUR
                          filter: ImageFilter.blur(sigmaX: _animationBlur.value,sigmaY: _animationBlur.value),
                          child:  Stack(
                            children:<Widget> [
                              Positioned(
                                left :10,
                                child: FadeTransition(
                                  opacity: _animationFade,
                                  child: Image.asset('imagens/detalhe1.png'),
                                )
                              ),
                              Positioned(
                                left :30,
                                child: Image.asset('imagens/detalhe2.png'),
                              )
                            ],
                          ),

                        ),
                      );
                    }

                ),
                Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                    children: <Widget>[
                      AnimatedBuilder(
                          animation:_animationSize,
                          builder: (context,widget){
                            return Container(
                              width: _animationSize.value,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 15 ,spreadRadius: 4
                                      )
                                    ]
                                ),
                                child: Column(
                                  children: <Widget>[
                                    InputCostomizado(hint: 'Email',),
                                    InputCostomizado(hint: 'Senha',obscureText: true,icon: Icon(Icons.lock,color: Colors.grey,),)
                                  ],
                                )

                            );
                          }
                      ),
                      SizedBox(height: 20),
                      BotaoAnimado(controller: _controller),
                      SizedBox(height: 20,),
                      SlideTransition(
                          position: _animationSlideT,
                        child: Text("Esqueci minha senha",style: TextStyle(
                            color: Color.fromRGBO(255, 100, 127, 1),
                            fontWeight: FontWeight.bold
                        ),
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
       ),
     ),
   );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

}