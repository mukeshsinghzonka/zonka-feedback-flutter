
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'dart:async';

import '../../../utils/color_constant.dart'; // For Timer

class UpdateWidget extends StatefulWidget {
  final int updateCount; // Number of updates

  const UpdateWidget({Key? key, required this.updateCount}) : super(key: key);

  @override
  _UpdateWidgetState createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    _updateVisibility(); // Set initial visibility based on the update count
  }

  @override
  void didUpdateWidget(UpdateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateVisibility(); // Update visibility if the count changes
  }

  @override
  void dispose() {
    _hideTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _startHideTimer() {
    _hideTimer?.cancel(); // Cancel any existing timer
    _hideTimer = Timer(const Duration(seconds: 10), () {
      setState(() {
        _isVisible = false; // Hide the widget after 10 seconds
      });
    });
  }

  void _updateVisibility() {
    if (widget.updateCount > 0 && !_isVisible) {
      setState(() {
        _isVisible = true;
      });
      _startHideTimer(); // Start the timer to hide the widget after 10 seconds
    } else if (widget.updateCount == 0 && _isVisible) {
      setState(() {
        _isVisible = false;
      });
      _hideTimer?.cancel(); // Cancel the timer if there are no updates
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height / 4.5,
      right: size.width / 10,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300), // Animation duration
        opacity: _isVisible ? 1.0 : 0.0, // Fade in/out
        child: _isVisible
            ? Container(
          decoration: const BoxDecoration(
            color:  Color(ColorConstant.themeColor), // Replace ColorConstant.themeColor with the actual color
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          padding: EdgeInsets.symmetric(
              vertical: size.width / 80, horizontal: size.height / 50),
          child: Text(
            "${widget.updateCount} Updates Available",
            style: const TextStyle(color: Colors.white),
          ),
        )
            : Container(), // Placeholder to remove the widget when hidden
      ),
    );
  }
}
