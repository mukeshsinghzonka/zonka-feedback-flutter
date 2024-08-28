
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingUPScreen extends StatefulWidget {
  const SettingUPScreen({super.key});

  @override
  State<SettingUPScreen> createState() => _SettingUPScreenState();
}

class _SettingUPScreenState extends State<SettingUPScreen> {
  @override
  void initState() {
    // TODO: implement initState
   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Setting up"),
      ),
    );
  }
}