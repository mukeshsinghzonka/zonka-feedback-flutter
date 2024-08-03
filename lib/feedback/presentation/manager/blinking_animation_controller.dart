import 'package:flutter/material.dart';

class BlinkingAnimmationController{


  late AnimationController _controller;
  late Animation<double> animation;

 void initAnimationController(TickerProvider vsync){
    _controller = AnimationController(
      duration: const Duration(milliseconds: 40),
      vsync: vsync,
    );

    animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

 Future<void> blinkingAnimation() async {
     await _controller.forward().then((value) => _controller.reverse());
  }

  
}