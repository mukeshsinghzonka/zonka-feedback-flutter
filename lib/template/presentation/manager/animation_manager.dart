

import 'package:flutter/widgets.dart';

class SlidingAnimationController{

  late AnimationController _controller;
  late Animation<Offset> animation;

   void initAnimationController(TickerProvider vsync)async {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );

    animation = Tween<Offset>(begin:Offset(-1, 0) , end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    await _controller.forward();
 }
  

  
//  Future<void> startAnimation() async {
//      await _controller.forward();
//  }
}