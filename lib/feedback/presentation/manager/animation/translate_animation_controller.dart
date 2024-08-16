import 'package:flutter/material.dart';

class TranslateAnimationController {
  
  late AnimationController _controller;
  late Animation<Offset> animation;

   void initAnimationController(TickerProvider vsync){
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: vsync,
    );

    animation = Tween<Offset>(begin: const Offset(1000, 0), end:const  Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );


  }


 Future<void> tranlateAnimation() async {
     await _controller.forward();
  }

}