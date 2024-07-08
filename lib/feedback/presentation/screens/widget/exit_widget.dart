

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExitWidget extends StatelessWidget {
  const ExitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: const Text(
                        'Powered By Zonka FeedBack',
                        style: TextStyle(fontFamily: 'Source Sans Pro'),
                      )),
                  GestureDetector(
                    onTap: () {
                  
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 20.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          color: Colors.black,
                          border: Border.all(color: Colors.blueAccent)),
                      alignment: Alignment.center,
                      child: const Text(
                        'Exit',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Source Sans Pro'),
                      ),
                    ),
                  ),
                ],
              );
  }
}