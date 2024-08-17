import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
class TranslateAnimationController extends GetxController {
  final SurveryApiFeedbackController surveryFeedbackApiController = Get.find<SurveryApiFeedbackController>();

  final RxMap<int,AnimationController> _controller = <int,AnimationController>{}.obs;
  RxMap<int, Animation<Offset>> animation = <int, Animation<Offset>>{}.obs;

  Future<void> initAnimationController(TickerProvider vsync) async {
    final screens = surveryFeedbackApiController.surveyModel.value.surveyScreens;
    // Initialize the animation map 
    for (int i = 0; i < screens.length; i++) {
    _controller[screens[i].screenSequenceOrder!] = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: vsync,
    );

      animation[screens[i].screenSequenceOrder!] = Tween<Offset>(
        begin: const Offset(1000, 0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent:  _controller[screens[i].screenSequenceOrder!]!,
          curve: Curves.linear,
        ),
      );
    }

    update();
  }

  void tranlateAnimateCall(int screenIndex){
    print("animationforward $screenIndex");
   _controller[screenIndex]?.forward();
   update();
  }


}

