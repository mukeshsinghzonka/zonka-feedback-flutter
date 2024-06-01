
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum Screen { login, signup , createaccount }

class SwitchScreenController extends GetxController {
  Rx<Screen> _currentScreen = Screen.login.obs;
    Rx<Screen>  get currentScreen => _currentScreen;

  void changeScreen(Screen screen) {
    _currentScreen.value = screen;
  }
}