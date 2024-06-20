
import 'package:get/get.dart';

enum Screen { login, signup , createaccount }

class SwitchScreenController extends GetxController {
  final Rx<Screen> _currentScreen = Screen.login.obs;
  Rx<Screen>  get currentScreen => _currentScreen;
  void changeScreen(Screen screen) {
    _currentScreen.value = screen;
  }
}